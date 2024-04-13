module Administrate
  module Page
    class Base
      def initialize(dashboard, options = {})
        @dashboard = dashboard
        @options = options
      end

      def resource_class_name
        @resource_class_name ||= dashboard.resource_class_name.to_s if dashboard.respond_to? :resource_class_name
        @resource_class_name ||= relative_resource_class_name
      end

      def relative_resource_class_name
        @relative_resource_class_name ||= dashboard.class.to_s.gsub('Dashboard', '')
      end

      def resource_name
        # @resource_name ||= resource_class.model_name.to_s.underscore
        @resource_name ||= relative_resource_class_name.to_s.underscore
      end

      def resource_path
        # @resource_path ||= resource_name.gsub("/", "_")
        @resource_path ||= resource_class.model_name.singular_route_key # route_key
      end

      def resource_class
        @resource_class ||= resource_class_name.constantize
      end

      def collection_includes
        dashboard.try(:collection_includes) || []
      end

      def item_includes
        dashboard.try(:item_includes) || []
      end

      def item_associations
        dashboard.try(:item_associations) || []
      end

      private

        def attribute_field(dashboard, resource, attribute_name, page)
          value = get_attribute_value(resource, attribute_name)
          field = dashboard.attribute_type_for(attribute_name)
          field.new(attribute_name, value, page, resource: resource)
        end

        def get_attribute_value(resource, attribute_name)
          resource.public_send(attribute_name)
        end

        attr_reader :dashboard, :options
    end
  end
end
