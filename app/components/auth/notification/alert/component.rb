class Auth::Notification::Alert::Component < ApplicationComponent
  delegate :flash, to: :helpers

  style do
    base { %w[] }
    variants do
      wrapper do
        alert { %w[bg-red-50] }
        notice { %w[bg-green-50] }
      end
      icon do
        alert { %w[text-red-400] }
        notice { %w[text-green-400] }
      end
      message do
        alert { %w[text-red-800] }
        notice { %w[text-green-800] }
      end
    end
  end

  def kind
    @kind ||= flash.keys.first
  end

  def message
    flash[kind]
  end

  def icon
    case kind.to_sym
    when :alert then 'heroicons/24/solid/x-circle.svg'
    when :notice then 'heroicons/24/solid/check-circle.svg'
    else raise ArgumentError, "Unknown flash kind: #{kind}"
    end
  end

  def render?
    message.present? && flash.any?
  end
end
