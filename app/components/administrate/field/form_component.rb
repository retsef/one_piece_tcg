module Administrate::Field
  class FormComponent < BaseComponent
    include ChangeCallback

    delegate :attribute, :error?, to: :field

    attr_reader :form

    def initialize(field:, form:, **options)
      super(field: field, **options)

      @form = form
    end
  end
end
