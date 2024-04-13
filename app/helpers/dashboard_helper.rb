module DashboardHelper
  PLURAL_MANY_COUNT = 2.1
  SINGULAR_COUNT = 1

  def dashboard_from_resource(resource_name)
    "#{resource_name.to_s.singularize}_dashboard".classify.constantize
  end

  def model_from_resource(resource_name)
    dashboard = dashboard_from_resource(resource_name)
    dashboard.try(:model) || resource_name.to_sym
  end

  def display_resource_name(resource_name, opts = {})
    dashboard_from_resource(resource_name).resource_name(
      count: opts[:singular] ? SINGULAR_COUNT : PLURAL_MANY_COUNT,
      default: default_resource_name(resource_name, opts)
    )
  end

  private

    def default_resource_name(name, opts = {})
      resource_name = (opts[:singular] ? name.to_s : name.to_s.pluralize)
      resource_name.tr('/', '_').titleize
    end
end
