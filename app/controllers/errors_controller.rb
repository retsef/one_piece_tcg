# frozen_string_literal: true

require 'net/http'

class ErrorsController < ApplicationController
  protect_from_forgery with: :null_session
  layout 'errors'

  before_action :fetch_exception, only: :internal_server_error
  skip_before_action :verify_authenticity_token, only: :crash_report

  def not_found
    render status: :not_found
  end

  def unprocessable
    render status: :unprocessable_entity
  end

  def upgrade_required
    render status: :upgrade_required
  end

  def internal_server_error
    render status: :internal_server_error
  end

  def service_unavailable
    render status: :service_unavailable
  end

  # Send errors to Sentry
  def crash_report
    envelope = request.body.read || ''
    piece = envelope.split("\n").first
    header = JSON.parse(piece)
    dsn = URI.parse(header['dsn'])
    project_id = dsn.path.tr('/', '')

    raise "Invalid sentry hostname: #{dsn.hostname}" if dsn.hostname != sentry_config.host
    raise "Invalid sentry project id: #{project_id}" unless sentry_config.project_ids.include?(project_id)

    url = URI.parse("https://#{sentry_config.host}/api/#{project_id}/envelope/")
    request = Net::HTTP::Post.new(url, envelope)

    Net::HTTP.start(url.host, url.port,
                    open_timeout: 3, read_timeout: 3) { |http| http.request(request) }

    head :ok
  rescue StandardError => _e
    # handle exception in your preferred style,
    # e.g. by logging or forwarding to server Sentry project
    Rails.logger.error('error tunneling to sentry')
  end

  private

    def sentry_config
      Rails.application.config.sentry
    end

    def fetch_exception
      @exception = request.env["action_dispatch.exception"]

      Sentry.capture_exception(@exception, **request.env) if @exception
    end
end
