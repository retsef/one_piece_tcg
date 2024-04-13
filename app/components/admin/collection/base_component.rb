class Admin::Collection::BaseComponent < ApplicationComponent
  set_as_abstract_class

  self.i18n_namespace = 'admin.collection'

  include ActiveLinkToHelper

  delegate :application_title, to: :view_context
end
