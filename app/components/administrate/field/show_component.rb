module Administrate::Field
  class ShowComponent < BaseComponent
    attr_reader :page

    def initialize(field:, page: nil, **options)
      super(field: field, **options)

      @page = page || field.page
    end
  end
end
