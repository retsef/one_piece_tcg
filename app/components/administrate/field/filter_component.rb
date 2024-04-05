module Administrate::Field
  class FilterComponent < BaseComponent
    attr_reader :form

    def initialize(field:, form:, **options)
      super(field:, **options)

      @form = form
    end

    delegate :filter_value, to: :helpers
  end
end
