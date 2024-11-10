class Admin::Navigation::BaseComponent < Admin::BaseComponent
  set_as_abstract_class

  self.i18n_namespace = 'admin.navigation'

  include ActiveLinkToHelper

  def namespace
    # view_context.try(:namespace) || :admin
    :admin
  end

  delegate :application_title, to: :view_context
end
