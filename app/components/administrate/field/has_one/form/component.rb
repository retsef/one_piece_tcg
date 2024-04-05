module Administrate::Field
  class HasOne::Form::Component < FormComponent
    def data
      field.data || field.nested_form.resource.class.new
    end

    def hide_label?
      field.options.dig(:hide_label, :form)
    end
  end
end
