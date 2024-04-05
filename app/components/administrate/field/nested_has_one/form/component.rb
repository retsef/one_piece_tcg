module Administrate::Field
  class NestedHasOne::Form::Component < HasOne::Form::Component
    def data
      field.data || field.nested_form.resource.class.new
    end

    def hide_label?
      field.options.dig(:hide_label, :form)
    end
  end
end
