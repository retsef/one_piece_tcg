module ApplicationHelper
  def application_title
    # Rails.application.class.module_parent_name.titlecase
    I18n.t('app.name')
  end

  def application_description
    application_title
  end
end
