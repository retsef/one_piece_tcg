module Administrate::Field
  class BelongsTo::Form::Component < FormComponent
    def collection
      # [[t('helpers.select.prompt'), nil]] + field.associated_resource_options
      field.associated_resource_options
    end

    def option_index
      collection.index { |opt| field.selected_option == (opt.is_a?(Array) ? opt.last : opt.to_s) } || 0
    end

    def option_label
      collection[option_index].then { |opt| opt.is_a?(Array) ? opt.first : opt.to_s }
    end

    def change_callback_param
      field.options[:change_callback_param] || field.permitted_attribute
    end
  end
end
