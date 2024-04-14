module Administrate::Field::Required
  extend ActiveSupport::Concern

  included do
    def required?
      return false unless resource.class.respond_to?(:validators_on)

      resource.class.validators_on(attribute).any? do |v|
        next false unless v.instance_of?(ActiveRecord::Validations::PresenceValidator)

        options = v.options
        next false if options.include?(:if)
        next false if options.include?(:unless)

        if (on_option = options[:on])
          next true if on_option == :create && !resource.persisted?
          next true if on_option == :update && resource.persisted?

          next false
        end

        true
      end
    end
  end
end
