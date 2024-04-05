module Administrate::Field
  class HasMany::Form::Component < FormComponent
    def collection
      # options_for_select(field.associated_resource_options, field.selected_options)
      field.associated_resource_options
    end

    def option_value
      # field.data
      field.selected_options.join(',')
    end

    def selected_resource_options
      field.associated_resource_options.select do |(_display, association_key)|
        field.selected_options.include?(association_key)
      end
    end

    def resource_checked?(value)
      selected_resource_options.any? { |(_display, association_key)| association_key == value }
    end

    delegate :display_candidate_resource, to: :field
  end
end
