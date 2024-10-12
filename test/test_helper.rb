ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def expansion_set_enabled?(expansion_set)
      return false unless Rails.features.to_h.key?(expansion_set)

      Rails.features.enabled?(expansion_set)
    end
  end
end
