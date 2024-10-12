module Administrate
  module Field
    class BelongsTo < Associative
      def self.permitted_attribute(attr, options = {})
        resource_class = options[:resource_class]
        if resource_class
          foreign_key_for(resource_class, attr)
        else
          Administrate.warn_of_missing_resource_class
          :"#{attr}_id"
        end
      end

      def self.eager_load?
        true
      end

      def permitted_attribute
        foreign_key
      end

      def associated_resource_options
        candidate_resources.map do |resource|
          [
            display_candidate_resource(resource),
            resource.send(association_primary_key)
          ]
        end
      end

      def selected_option
        data&.send(association_primary_key)
      end

      def include_blank_option
        options.fetch(:include_blank, self.class.reflection(resource.class, attribute).options[:optional] || true)
      end

      def linkable?
        data.try(:persisted?)
      end

      def nested_show
        @nested_show ||= Administrate::Page::Show.new(
          resolver.dashboard_class.new,
          data || resolver.resource_class.new
        )
      end

      private

        def resolver
          @resolver ||=
            Administrate::ResourceResolver.new("admin/#{associated_class.name}")
        end

        def candidate_resources
          scope = if (option_scope = options[:scope])
                    option_scope.arity == 1 ? option_scope.call(self) : option_scope.call
          else
                    associated_class.all
          end

          order = options.delete(:order)
          order ? scope.reorder(order) : scope
        end

        def display_candidate_resource(resource)
          associated_dashboard.display_resource(resource)
        end
    end
  end
end
