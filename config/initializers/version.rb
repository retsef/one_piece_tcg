Rails.application.config.app_version = ENV.fetch('RELEASE_VERSION', 'main.0.0')
Rails.application.config.git_revision = ENV['GIT_REVISION']
