Rails.configuration.after_initialize do
  Rails.application.config.tap do |config|
    config.admin_navigation = ActiveSupport::OrderedOptions.new

    main_entries = []

    main_entries << Admin::MenuItem.new(label: I18n.t('admin.navigation.main.home.title'),
                                        icon: I18n.t('admin.navigation.main.home.icon'),
                                        url: :admin_root_path,
                                        active_matcher: %w[admin/home show])


    main_entries << Admin::MenuItem.new(label: I18n.t('admin.navigation.main.home.title'),
                                        icon: I18n.t('admin.navigation.main.home.icon'),
                                        url: :admin_cards_path,
                                        active_matcher: %w[admin/cards index])

    config.admin_navigation.main_entries = main_entries

    # Secondary entries
    secondary_entries = []

    secondary_entries << Admin::MenuItem.new(label: I18n.t('admin.navigation.main.feedback.title'),
                                             icon: I18n.t('admin.navigation.main.feedback.icon'),
                                             data: { turbo_frame: 'form_modal' },
                                             url: :new_user_feedback_path)

    secondary_entries << Admin::MenuItem.new(label: I18n.t('admin.navigation.main.help.title'),
                                             icon: I18n.t('admin.navigation.main.help.icon'),
                                             url: :help_url)

    config.admin_navigation.secondary_entries = secondary_entries


    # Settings

    settings_entries = []

    # settings_entries << Admin::MenuItem.new(label: I18n.t('settings.navigation.main.integrations.title'),
    #                                         icon: I18n.t('settings.navigation.main.integrations.icon'),
    #                                         url: :edit_settings_integrations_path,
    #                                         coming_soon: true)

    config.admin_navigation.settings_entries = settings_entries
  end
end
