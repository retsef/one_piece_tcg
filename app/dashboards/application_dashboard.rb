require 'administrate/base_dashboard'

class ApplicationDashboard < Administrate::BaseDashboard
  class << self
    delegate :model_name, to: :model
    delegate :class, to: :model, prefix: true
  end

  def filterable_attributes
    self.class::FILTER_ATTRIBUTES
  end

  def display_resource(resource)
    "#{resource.class.model_name.human} ##{resource.id}"
  end

  private

    def attribute_includes(attributes)
      attributes.filter_map do |key|
        field = attribute_type_for(key)

        (field.respond_to?(:options) ? field.options.fetch(:includes, key) : key) if field.eager_load?
      end.flatten
    end

    def attribute_associated(attributes)
      attributes.filter_map do |key|
        field = attribute_type_for(key)

        (field.respond_to?(:options) ? field.options.fetch(:association, key) : key) if field.associative?
      end.flatten
    end
end
