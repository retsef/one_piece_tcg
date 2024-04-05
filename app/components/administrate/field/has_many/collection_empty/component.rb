module Administrate::Field
  class HasMany::CollectionEmpty::Component < BaseComponent
    attr_reader :table_title, :collection_presenter, :collection_field_name, :page, :resources

    def initialize(field:, collection_presenter:, collection_field_name:, page:, resources:, table_title: '', **options)
      super(field:, **options)

      @table_title = table_title
      @collection_presenter = collection_presenter
      @collection_field_name = collection_field_name
      @page = page
      @resources = resources
    end

    delegate :local_time, to: :helpers

    def icon
      I18n.t("#{namespace}.collection.empty.#{collection_resource_name}.icon")
    end

    def title
      I18n.t("#{namespace}.collection.empty.#{collection_resource_name}.title")
    end

    def body
      I18n.t("#{namespace}.collection.empty.#{collection_resource_name}.body")
    end

    private

      def collection_resource_name
        collection_presenter.resource_name
      end
  end
end
