class Admin::Notification::Alert::Component < Admin::Notification::BaseComponent
  style :icon do
    variants do
      color do
        warning { 'text-yellow-400' }
        error { 'text-red-400' }
        success { 'text-green-400' }
        info { 'text-blue-400' }
      end
      background do
        warning { 'bg-yellow-100' }
        error { 'bg-red-100' }
        success { 'bg-green-100' }
        info { 'bg-blue-100' }
      end
    end
    defaults { { color: :info, background: :info } }
  end

  attr_reader :title, :description, :confirm, :type

  def initialize(title:, description:, type: :warning, confirm: nil)
    super

    @type = type.to_sym

    @title = title
    @description = description
    @confirm = confirm || I18n.t('admin.notification.alert.confirm')
  end

  def icon
    case type
    when :warning then 'heroicons/24/solid/exclamation-triangle.svg'
    when :error then 'heroicons/24/solid/exclamation-circle.svg'
    when :success then 'heroicons/24/solid/check.svg'
    else 'heroicons/24/solid/information-circle.svg'
    end
  end

  %i[warning error success info].each do |type|
    define_method(:"#{type}?") do
      self.type == type
    end
  end

  def audio
    case type
    when :warning, :error then helpers.asset_path('denied.wav')
    end
  end
end
