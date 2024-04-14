class Administrate::Field::NestedHasOne < Administrate::Field::HasOne
  DEFAULT_ATTRIBUTES = %i[id _destroy].freeze

  def nested_fields
    nested_form.attributes.reject do |nested_field|
      skipped_fields.include?(nested_field.attribute)
    end
  end

  def nested_fields_for_builder(form_builder)
    return nested_fields unless form_builder.index.is_a? Integer

    nested_fields.each do |nested_field|
      next if nested_field.resource.blank?

      # inject current data into field
      resource = data[form_builder.index]
      nested_field.instance_variable_set(
        :@data,
        resource.send(nested_field.attribute)
      )
    end
  end

  private

    def skipped_fields
      Array(options[:skip])
    end
end
