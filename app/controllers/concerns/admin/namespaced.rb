module Admin
  module Namespaced
    extend ActiveSupport::Concern

    included do
      class_attribute :lookup_namespace, default: :admin

      def self.default_namespace(namespace)
        self.lookup_namespace = namespace
      end

      def namespace
        self.class.lookup_namespace
      end

      helper_method :namespace

      def routes
        @routes ||= Administrate::Namespace.new(namespace).routes.to_set
      end
    end
  end
end
