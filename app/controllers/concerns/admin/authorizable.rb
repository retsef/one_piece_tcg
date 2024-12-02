module Admin
  module Authorizable
    extend ActiveSupport::Concern

    included do
      # Unification of
      # {Administrate::ApplicationController#existing_action? existing_action?}
      # and
      # {Administrate::ApplicationController#authorized_action?
      # authorized_action?}
      #
      # @param target [ActiveRecord::Base, Class, Symbol, String] A resource,
      #   a class of resources, or the name of a class of resources.
      # @param action_name [String, Symbol] The name of an action that might be
      #   possible to perform on a resource or resource class.
      # @return [Boolean] Whether the action both (a) exists for the record class,
      #   and (b) the current user is authorized to perform it on the record
      #   instance or class.
      def accessible_action?(target, action_name, options = {})
        target = target.to_sym if target.is_a?(String)
        target_class_or_class_name =
          target.is_a?(ActiveRecord::Base) ? target.class : target

        existing_action?(target_class_or_class_name, action_name) &&
          authorized_action?(target, action_name, options)
      end

      # Whether the current user is authorized to perform the named action on the
      # resource.
      #
      # @param _resource [ActiveRecord::Base, Class, String, Symbol] The
      #   temptative target of the action, or the name of its class.
      # @param _action_name [String, Symbol] The name of an action that might be
      #   possible to perform on a resource or resource class.
      # @return [Boolean] `true` if the current user is authorized to perform the
      #   action on the resource. `false` otherwise.
      def authorized_action?(resource, action = action_name, options = {})
        allowed_to? :"#{action}?", resource, **options
      end

      # Whether the named action route exists for the resource class.
      #
      # @param resource [Class, String, Symbol] A class of resources, or the name
      #   of a class of resources.
      # @param action_name [String, Symbol] The name of an action that might be
      #   possible to perform on a resource or resource class.
      # @return [Boolean] `true` if a route exists for the resource class and the
      #   action. `false` otherwise.
      def existing_action?(resource, action_name)
        routes.include?([ resource.to_s.underscore.pluralize, action_name.to_s ])
      end

      helper_method :existing_action?, :authorized_action?, :accessible_action?

      private

        def authorize_resource(resource, options = {})
          raise Administrate::NotAuthorizedError.new(action: action_name, resource: resource) unless authorized_action?(resource, action_name)

          # resource
          authorize! resource, **options
        end

        alias_method :scoped_resource_without_authorization, :scoped_resource

        def scoped_resource
          resource = scoped_resource_without_authorization
          authorized_scope(resource)
        end

        def routes
          @routes ||= Administrate::Namespace.new(namespace).routes.to_set
        end
    end
  end
end
