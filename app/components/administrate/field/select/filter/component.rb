module Administrate::Field
  class Select::Filter::Component < FilterComponent
    def field_key
      field.resource_class.ransackable_scopes.include?(field.attribute) ? field.attribute : "#{field.attribute}_eq"
    end

    def current_value
      filter_value field_key
    end

    def collection
      [ [ t('helpers.select.prompt'), nil ] ] + field.selectable_options
    end

    def option_index
      collection.index { |opt| field.data == (opt.is_a?(Array) ? opt.last : opt.to_s) } || 0
    end

    def option_label
      collection[option_index].then { |opt| opt.is_a?(Array) ? opt.first : opt.to_s }
    end
  end
end
