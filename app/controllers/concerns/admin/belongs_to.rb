module Admin
  module BelongsTo
    extend ActiveSupport::Concern

    class_methods do
      delegate :dashboard_class, :resource_class, :resource_name,
               to: :parent_resource_resolver, prefix: :parent

      def parent_resource_resolver
        Administrate::ResourceResolver.new(controller_path.remove(%r{/.\w+$}))
      end
    end

    included do
      authorize parent_resource_name, through: :_parent_resource

      private

        helper_method :parent_page

        delegate :dashboard_class, :resource_class, :resource_name,
                 to: :parent_resource_resolver, prefix: :parent
        helper_method :parent_resource_name
        helper_method :parent_resource_class

        def parent_resource_resolver
          @parent_resource_resolver ||= self.class.parent_resource_resolver
        end

        def parent_dashboard
          @parent_dashboard ||= parent_dashboard_class.new
        end

        def parent_param_id
          :"#{parent_resource_name}_id"
        end

        def requested_parent_resource
          @requested_parent_resource ||= find_parent_resource(params[parent_param_id]).tap do |resource|
            authorize_resource(resource)
          end
        end

        def find_parent_resource(param)
          parent_scoped_resource.find(param)
        end

        def scoped_parent_resource
          resource_class.default_scoped
        end

        def new_resource
          resource_class.new(parent_resource_name => requested_parent_resource)
        end

        def parent_page
          @parent_page ||= Administrate::Page::Show.new(parent_dashboard, requested_parent_resource)
        end

        def parent_scoped_resource
          parent_resource_class.default_scoped
        end

        def scoped_resource
          super.where(parent_resource_name => requested_parent_resource)
        end

        def sanitized_order_params(page, current_field_name)
          collection_names = page.item_associations + [ current_field_name ]
          association_params = collection_names.map do |assoc_name|
            { assoc_name => %i[order direction page per_page] }
          end
          params.permit(:search, :id, parent_param_id, :page, :per_page, association_params, q: {})
        end

        def after_resource_created_path(_requested_resource)
          [ namespace, requested_parent_resource, resource_class ]
        end

        def after_resource_updated_path(_requested_resource)
          [ namespace, requested_parent_resource, resource_class ]
        end

        def after_resource_destroy_path(_requested_resource)
          [ namespace, requested_parent_resource, resource_class ]
        end

        def _parent_resource
          @requested_parent_resource || find_parent_resource(params[parent_param_id])
        end
    end
  end
end
