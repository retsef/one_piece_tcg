module Administrate::Field
  class ActiveStorage::Preview::Component < BaseComponent
    attr_reader :attachment, :preview_options

    def initialize(field:, attachment:, preview_options:, **options)
      super(field:, **options)

      @attachment = attachment
      @preview_options = preview_options || {}
    end
  end
end
