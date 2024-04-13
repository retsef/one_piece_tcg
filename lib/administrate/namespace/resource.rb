module Administrate
  class Namespace
    class Resource
      attr_reader :namespace, :resource

      def initialize(namespace, resource)
        @namespace = namespace
        @resource = resource
      end

      delegate :to_s, to: :name

      def to_sym
        name
      end

      def name
        resource.to_s.gsub(%r{^#{namespace}/}, "").to_sym
      end

      def path
        name.to_s.tr("/", "_")
      end
    end
  end
end
