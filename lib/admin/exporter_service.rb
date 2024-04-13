require 'csv'

module Admin
  class ExporterService
    def self.csv(dashboard, resource_class, resources)
      new(dashboard, resource_class, resources).csv
    end

    def initialize(dashboard, resource_class, resources)
      @dashboard = dashboard
      @resource_class = resource_class
      @resources = resources
    end

    def csv
      CSV.generate(headers: true) do |csv|
        csv << headers

        collection.find_each do |record|
          csv << attributes_to_export.map do |attribute_key, attribute_type|
            record_attribute(record, attribute_key, attribute_type)
          end
        end
      end
    end

    private

      attr_reader :dashboard, :resource_class, :resources, :sanitizer

      def record_attribute(record, attribute_key, attribute_type)
        field = attribute_type.new(attribute_key, record.send(attribute_key), 'index', resource: record)
        transform_on_export = attribute_type.respond_to?(:options) && attribute_type.options[:transform_on_export]

        return transform_on_export.call(field) if transform_on_export.is_a? Proc

        case field.class
        when Administrate::Field::BelongsTo, Administrate::Field::HasOne, Administrate::Field::Polymorphic
          field.display_associated_resource if field.data
        when Administrate::Field::HasMany
          field.data.count if field.data # rubocop:disable Style/SafeNavigation
        when Administrate::Field::DateTime
          field.datetime if field.data
        when Administrate::Field::Date
          field.date if field.data
        when Administrate::Field::Email, Administrate::Field::Select
          field.data
        when Administrate::Field::Password, Administrate::Field::String, Administrate::Field::Text
          field.truncate
        when Administrate::Field::Time
          field.data.strftime('%I:%M%p').to_s if field.data
        else
          field.to_s
        end
      end

      def headers
        attributes_to_export.map do |attribute_key, _|
          attr_key = attribute_key.to_s

          if attr_key.include?('_id')
            attr_key
          else
            I18n.t(
              "helpers.label.#{resource_class.name}.#{attr_key}",
              default: attr_key
            ).titleize
          end
        end
      end

      def attributes_to_export
        @attributes_to_export ||= dashboard.class::ATTRIBUTE_TYPES.select do |_attribute_key, attribute_type|
          attribute_options = attribute_type.try(:options)

          !attribute_options || attribute_options[:export] != false
        end
      end

      def collection
        resources
      end
  end
end
