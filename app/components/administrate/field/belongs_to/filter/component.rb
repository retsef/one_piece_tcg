module Administrate::Field
  class BelongsTo::Filter::Component < FilterComponent
    def field_key
      field.resource_class.ransackable_scopes.include?(field.attribute) ? field.attribute : "#{field.attribute}_id_eq"
    end

    def desc
      field.associated_class.method_defined?(:dashboard_display_name) ? :dashboard_display_name : :to_s
    end

    def current_value
      filter_value(field_key).to_i
    end

    def collection
      [ [ t('helpers.select.prompt'), nil ] ] + field.associated_resource_options
    end

    def option_index
      collection.index { |opt| current_value == (opt.is_a?(Array) ? opt.last : opt.id) } || 0
    end

    def option_label
      collection[option_index].then { |opt| opt.is_a?(Array) ? opt.first : opt.send(desc) }
    end
  end
end
