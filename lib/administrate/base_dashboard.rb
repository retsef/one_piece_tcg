module Administrate
  class BaseDashboard
    include Administrate

    DASHBOARD_SUFFIX = "Dashboard".freeze

    cattr_accessor :model

    class << self
      def subject(model)
        @model = model
      end

      def model
        @model ||= to_s.chomp(DASHBOARD_SUFFIX).classify.constantize
      end

      def resource_name(opts)
        model.model_name.human(opts)
      end
    end

    def attribute_types
      self.class::ATTRIBUTE_TYPES
    end

    def attribute_type_for(attribute_name)
      attribute_types.fetch(attribute_name) do
        raise attribute_not_found_message(attribute_name)
      end
    end

    def attribute_types_for(attribute_names)
      attribute_names.index_with do |name|
        attribute_type_for(name)
      end
    end

    def all_attributes
      attribute_types.keys
    end

    def form_attributes(action = nil)
      action =
        case action
        when "update" then "edit"
        when "create" then "new"
        else action
        end
      specific_form_attributes_for(action) || self.class::FORM_ATTRIBUTES
    end

    def specific_form_attributes_for(action)
      return unless action

      cname = "FORM_ATTRIBUTES_#{action.upcase}"

      self.class.const_get(cname) if self.class.const_defined?(cname)
    end

    def permitted_attributes(action = nil)
      form_attributes(action).map do |attr|
        attribute_types[attr].permitted_attribute(
          attr,
          resource_class: self.class.model,
          action: action
        )
      end.uniq
    end

    def show_page_attributes
      self.class::SHOW_PAGE_ATTRIBUTES
    end

    def collection_attributes
      self.class::COLLECTION_ATTRIBUTES
    end

    def search_attributes
      attribute_types.keys.select do |attribute|
        attribute_types[attribute].searchable?
      end
    end

    def display_resource(resource)
      "#{resource.class} ##{resource.id}"
    end

    def collection_includes
      attribute_includes(collection_attributes)
    end

    def item_includes
      # Deprecated, internal usage has moved to #item_associations
      Administrate.warn_of_deprecated_method(self.class, :item_includes)
      attribute_includes(show_page_attributes)
    end

    def item_associations
      attribute_associated(show_page_attributes)
    end

    private

      def attribute_not_found_message(attr)
        "Attribute #{attr} could not be found in #{self.class}::ATTRIBUTE_TYPES"
      end

      def attribute_includes(attributes)
        attributes.filter_map do |key|
          field = attribute_type_for(key)

          key if field.eager_load?
        end
      end

      def attribute_associated(attributes)
        attributes.filter_map do |key|
          field = attribute_type_for(key)

          key if field.associative?
        end
      end
  end
end
