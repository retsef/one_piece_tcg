module Administrate::Field
  class ActiveStorage::Item::Component < BaseComponent
    attr_reader :attachment, :preview_options

    def initialize(field:, attachment:, preview_options:, **options)
      super(field: field, **options)

      @attachment = attachment
      @preview_options = preview_options
    end
  end
end
