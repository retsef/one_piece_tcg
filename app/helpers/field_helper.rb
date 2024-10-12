module FieldHelper
  # A helper method to render a field component.
  def render_field(field, locals = {}, options = {})
    case field
    when Symbol, String
      page = locals.fetch(:page, action_name)
      if page.is_a? Administrate::Page::Base
        field = page.attribute_field_for(field)

        component = Administrate::Field::BaseComponent.find_by(field, page)
        return render component.new(field:, **locals, page:, options:)
      end

      field = build_field(field, page, locals)
      page ||= locals.fetch(:page, field.page)
      component = Administrate::Field::BaseComponent.find_by(field, page)

      render component.new(field:, **locals, options:)
    when Administrate::Field::Base
      page ||= locals.fetch(:page, field.page)
      component = Administrate::Field::BaseComponent.find_by(field, page)

      render component.new(field:, **locals, options:)
    else
      raise ArgumentError,
            "Invalid field: #{field.inspect}. Must be a symbol, string, or Administrate::Field::Base instance."
    end
  end

  def cache_key_for_field(field, locals = {})
    case field
    when Symbol, String
      # TODO: allow to autodetect resource attribute
      resource = locals.fetch(:resource) { resource_class.new }
      page = locals.fetch(:page, action_name)

      [ resource, 'fields', field, page ]
    when Administrate::Field::Base
      [ field.resource, 'fields', field.name, field.page ]
    else
      raise ArgumentError, "Invalid field: #{field.inspect}. Must be a symbol, string, or Administrate::Field::Base instance."
    end
  end

  private

    def build_field(field, page, locals = {})
      resource = locals.fetch(:resource) { resource_class.new }
      value = locals.fetch(:value, resource.send(field))
      dashboard = locals.fetch(:dashboard, "#{resource.class}Dashboard".constantize.new)

      dashboard.attribute_type_for(field.to_sym).new(field.to_sym, value, page, resource:)
    end
end
