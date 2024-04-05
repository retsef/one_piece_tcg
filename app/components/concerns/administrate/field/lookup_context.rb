module Administrate::Field::LookupContext
  extend ActiveSupport::Concern

  PAGE_PREFIXES = %w[Administrate::Page:: Settings::Page::].freeze

  class_methods do
    def find_by(field, page)
      page_name ||= page.class.name.to_s.remove(*PAGE_PREFIXES) if page.is_a?(Administrate::Page::Base)
      page_name ||= page.to_s.camelcase
      page_name = 'Index' if page_name == 'Collection'

      # field component lookup
      candidated_fields = []

      resource_class_name = field.resource_class_name

      # field component lookup for settings
      if page.is_a?(Administrate::Page::Base) && page.class.name.to_s.include?('Settings::Page::')
        page_namespace = 'Administrate::Field::Settings'

        candidated_fields += find_by_resource(resource_class_name, field, page_namespace, page_name)
        candidated_fields += find_by_resource(field.resource_class.superclass.name, field, page_namespace, page_name) if field.resource_sti?
      end

      # field component lookup for base
      page_namespace = 'Administrate::Field'
      candidated_fields += find_by_resource(resource_class_name, field, page_namespace, page_name)
      candidated_fields += find_by_resource(field.resource_class.superclass.name, field, page_namespace, page_name) if field.resource_sti?

      # Fallback to default field type
      candidated_fields << "#{page_namespace}::#{field.class.field_type.camelcase}::#{page_name}::Component"

      candidated_fields.uniq.detect(&:safe_constantize).constantize
    end

    private

      def find_by_resource(resource_class_name, field, page_namespace, page)
        candidated_fields = []

        # find field by resource_class_name
        candidated_fields << "#{page_namespace}::#{resource_class_name}::#{field.attribute.to_s.camelcase}::#{page}::Component"
        candidated_fields << "#{page_namespace}::#{resource_class_name}::#{field.class.field_type.camelcase}::#{page}::Component"

        # find field by associated_class_name
        if field.class.associative?
          associated_class_name = field.associated_class_name
          candidated_fields << "#{page_namespace}::#{resource_class_name}::#{associated_class_name}::#{page}::Component"
          candidated_fields << "A#{page_namespace}::#{resource_class_name}::#{associated_class_name.pluralize}::#{page}::Component"

          candidated_fields << "#{page_namespace}::#{associated_class_name}::#{field.class.field_type.camelcase}::#{page}::Component"
          candidated_fields << "#{page_namespace}::#{associated_class_name}::#{page}::Component"
          candidated_fields << "#{page_namespace}::#{associated_class_name.pluralize}::#{page}::Component"
        end

        candidated_fields
      end
  end
end
