PENTEST_CONFIG  = { maxretry: 1, findtime: 10.minutes, bantime: 5.minutes }.freeze
THROTTLE_CONFIG = { limit: 5, period: 60 }.freeze

Rack::Attack.enabled = Rails.env.production?

Rack::Attack.blocklist("fail2ban pentesters") do |req|
  ip = req.env["HTTP_FLY_CLIENT_IP"]

  Rack::Attack::Fail2Ban.filter("pentesters-#{ip}", PENTEST_CONFIG) do
    CGI.unescape(req.query_string).include?("/etc/passwd") ||
      req.path.include?("/etc/passwd") || req.path.include?("wp-admin") ||
      req.path.include?("wp-includes") || req.path.include?(".git/config") ||
      req.path.include?("wp-login")
  end
end

Rack::Attack.throttle("limit decrypt attempts", THROTTLE_CONFIG) do |req|
  ip = req.env["HTTP_FLY_CLIENT_IP"]

  _controller, id, path = req.path.split("/").compact_blank

  "#{id}-#{ip}" if path == "d" && req.post?
end

Rack::Attack.throttle("limit logins per email", THROTTLE_CONFIG) do |req|
  if req.path == "/login" && req.post?
    if (req.params["user"].to_s.size > 0) and (req.params["user"]["email"].to_s.size > 0)
      req.params["user"]["email"]
    end
  end
end

ActiveSupport::Notifications.subscribe(/rack_attack/) do |name, start, finish, request_id, payload|
  req = payload[:request]
  if %i[throttle].include? req.env['rack.attack.match_type']
    info = "Remote Ip: #{req.ip}"
    rack_attack_throttle_data = req.env['rack.attack.throttle_data']['req/ip']
    Rails.logger.info info
  end
end
