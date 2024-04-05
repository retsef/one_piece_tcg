module Administrate::Field
  class String::Filter::Component < FilterComponent
    def field_key
      field.resource_class.ransackable_scopes.include?(field.attribute) ? field.attribute : "#{field.attribute}_cont"
    end
  end
end
