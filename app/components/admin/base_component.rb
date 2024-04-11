class Admin::BaseComponent < ApplicationComponent
  set_as_abstract_class

  include ActionPolicy::Behaviour

  authorize :user, through: :current_user
  authorize :store, through: :current_store

  delegate :current_user, :current_store, to: :controller
  delegate :accessible_action?, to: :controller

  def namespace
    # view_context.try(:namespace) || :admin
    :admin
  end

  def authorization_namespace
    ::Admin
  end
end
