require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OnePieceTcg
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    config.middleware.use Rack::Deflater
    # config.middleware.use Rack::Attack

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.eager_load_paths << Rails.root.join('app/forms')
    config.eager_load_paths << Rails.root.join('app/fields')
    config.eager_load_paths << Rails.root.join('app/services')
    config.eager_load_paths << Rails.root.join('app/cloners')
    config.eager_load_paths << Rails.root.join('lib')

    # I18n
    config.i18n.load_path += Rails.root.glob('config/locales/**/*.{rb,yml}')

    # Permitted locales available for the application
    config.i18n.available_locales = %i[en it]

    # Set default locale to something other than :en
    config.i18n.default_locale = :en

    def release
      @release ||= ENV.fetch('RELEASE_VERSION', 'main.0.0')
    end
  end
end
