source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.0"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.7"
gem "pg", "~> 1.4"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.2"

gem "solid_cache", "~> 0.6"
gem "solid_queue", "~> 0.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.4"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

group :assets, :default do
  gem 'propshaft'
  gem 'cssbundling-rails'
  gem 'inline_svg'

  gem 'importmap-rails'
  gem 'stimulus-rails'
  gem 'turbo-rails'
  # gem 'requestjs-rails'
end

gem 'view_component'
gem 'view_component-contrib'
gem 'view_component-form'
# gem "merge_attributes", github: "Amba-Health/merge_attributes", branch: "main"
# gem "view_component_attributes", github: "Amba-Health/view_component_attributes", branch: "main"

group :search, :default do
  gem 'pagy'
  gem 'groupdate'

  gem 'acts_as_list'
  gem 'has_scope'
  # gem 'order_query', '~> 0.5.2'
  gem 'ransack'
end

group :auth, :default do
  # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
  # gem "bcrypt", "~> 3.1.7"

  gem 'pwned'
  gem 'rotp'
  # gem 'webauthn'

  # Policy
  gem 'action_policy'
end

# gem 'discard', '~> 1.2'
# gem 'downstream', '~> 1.5'

# gem 'clowne'

gem 'treetop'

group :email, :default do
  gem 'premailer-rails'
end

group :utils, :default do
  gem 'accept_language'
  gem 'addressable'
  gem 'store_attribute'

  gem 'name_of_person'
  gem 'local_time'
  gem 'carmen'
  gem 'barby'

  gem 'nokogiri'
end

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"
gem 'active_storage_validations'

gem "aws-sdk-s3", require: false, group: :aws

gem 'rack-cors'
gem 'rack-attack'

group :error_tracking, :default do
  gem "sentry-ruby"
  gem "sentry-rails"

  gem 'stackprof'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem 'faker', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'listen'

  gem 'kamal'

  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-capybara', require: false

  gem 'annotate'
  gem 'cacheflow'
  # gem 'bullet'
  gem 'active_record_query_trace'

  gem 'brakeman'
  gem 'bundler-audit'

  gem 'i18n-tasks', '~> 1.0.14'

  gem 'lookbook'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'
  # gem 'memory_profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "show_me_the_cookies"

  gem "vcr"
  gem "webmock"
  gem "simplecov"

  gem 'timecop'
end
