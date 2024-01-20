# Rails.application.config.sentry = Rails.application.config_for(:sentry)

Sentry.init do |config|
  # config.dsn = "https://9ac2047e84554f87aa56a7ffb4de5936@#{Rails.application.config.sentry.host}/#{Rails.application.config.sentry.project_id}"
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  config.enabled_environments = %w[production staging]
  config.release = ENV.fetch('RELEASE_VERSION', 'main.0.0')

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0

  config.profiles_sample_rate = 1.0
end
