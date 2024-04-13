# Get model name from controller name (e.g. Admin::OrdersController -> Order)
module Admin::Resourced
  extend ActiveSupport::Concern

  included do
    delegate :dashboard_class, :resource_class, :resource_name, :namespace, to: :resource_resolver

    def resource_resolver
      @resource_resolver ||= self.class.resource_resolver
    end
  end

  class_methods do
    def resource_resolver
      Administrate::ResourceResolver.new(controller_path)
    end

    delegate :dashboard_class, :resource_class, :resource_name, to: :resource_resolver
  end
end
