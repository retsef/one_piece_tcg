class Administrate::Field::NestedHasMany < Administrate::Field::HasMany
  DEFAULT_ATTRIBUTES = %i[id _destroy].freeze

  def allow_new_record?
    options.fetch(:allow_new_record, true)
  end

  def allow_destroy?
    options.fetch(:allow_destroy, true)
  end

  def nested_fields(resource = new_resource)
    associated_form(resource).attributes.reject do |nested_field|
      skipped_fields.include?(nested_field.attribute)
    end
  end

  def nested_fields_for_builder(form_builder)
    nested_fields(form_builder.object)
  end

  def to_s
    data
  end

  def self.dashboard_for_resource(resource_class, _attr)
    # "#{associated_class_name(resource_class, attr)}Dashboard".constantize
    "#{resource_class.name}Dashboard".constantize
  end

  def self.associated_attributes(resource_class, attr)
    dashboard_class = dashboard_for_resource(resource_class, attr)
    DEFAULT_ATTRIBUTES + dashboard_class.new.permitted_attributes
  end

  def self.permitted_attribute(attr, options = {})
    given_class_name = options[:class_name]
    perm_resource_class =
      if given_class_name
        # Administrate.warn_of_deprecated_option(:class_name)
        given_class_name.constantize
      else
        options[:resource_class]
      end

    {
      "#{attr}_attributes":         associated_attributes(perm_resource_class, attr)
    }
  end

  # def associated_class_name
  #   self.class.associated_class_name(resource.class, attribute)
  # end

  def associated_class_name
    if option_given?(:class_name)
      deprecated_option(:class_name)
    else
      # self.class.associated_class_name(resource.class, attribute)
      self.class.associated_class(resource.class, attribute).name
    end
  end

  def association_name
    options.fetch(:association_name) do
      associated_class_name.underscore.pluralize[%r{([^/]*)$}, 1]
    end
  end

  def associated_form(resource = new_resource)
    Administrate::Page::Form.new(associated_dashboard, resource)
  end

  private

    def new_resource
      @new_resource ||= associated_class.new
    end

    def skipped_fields
      Array(options[:skip])
    end
end
