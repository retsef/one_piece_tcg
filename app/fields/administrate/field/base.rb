module Administrate
  module Field
    class Base
      include Required

      def self.with_options(options = {})
        Deferred.new(self, options)
      end

      def self.associative?
        self < Associative
      end

      def self.eager_load?
        false
      end

      def self.searchable?
        false
      end

      def self.editable_inline?
        false
      end

      def editable_inline?
        options.fetch(:editable_inline, self.class.editable_inline?)
      end

      def self.field_type
        to_s.split('::').last.underscore
      end

      def self.permitted_attribute(attr, _options = nil)
        attr
      end

      def initialize(attribute, data, page, options = {})
        @attribute = attribute
        @data = data
        @page = page
        @resource = options.delete(:resource)
        @options = options
      end

      def self.html_class
        field_type.dasherize
      end

      def html_class
        self.class.html_class
      end

      def hidden?
        false
      end

      def name
        attribute.to_s
      end

      attr_reader :attribute, :data, :options, :page, :resource

      def error?
        resource.errors.key? attribute
      end

      def human_name
        resource_class.human_attribute_name(name)
      end

      delegate :class, to: :resource, prefix: true
      delegate :name, to: :resource_class, prefix: true

      def resource_name
        resource_class.model_name.singular
      end

      def resource_sti?
        resource.try("#{resource.class.inheritance_column}?")
      end
    end
  end
end
