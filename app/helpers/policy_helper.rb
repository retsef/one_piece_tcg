module PolicyHelper
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
  def accessible_action?(target, action_name)
    target = target.to_sym if target.is_a?(String)
    target_class_or_class_name = target.is_a?(ActiveRecord::Base) ? target.class : target

    existing_action?(target_class_or_class_name, action_name) &&
      authorized_action?(target, action_name)
  end
end
