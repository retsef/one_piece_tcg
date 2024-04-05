module Administrate::Field
  class HasMany::Show::Component < ShowComponent
    def hide_label?
      field.options.dig(:hide_label, :summary)
    end

    def order
      field.order_from_params(params.fetch(field.name, {}))
    end

    def page_number
      params.fetch(field.name, {}).fetch(:page, 1)
    end
  end
end
