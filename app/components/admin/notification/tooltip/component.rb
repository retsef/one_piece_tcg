class Admin::Notification::Tooltip::Component < Admin::Notification::BaseComponent
  style do
    variants do
      position do
        top { %w[bottom-full left-1/2 mb-3 -translate-x-1/2] }
        bottom { %w[top-full left-1/2 mt-3 -translate-x-1/2] }
        right { %w[left-full top-1/2 ml-3 -translate-y-1/2] }
        left { %w[right-full top-1/2 mr-3 -translate-y-1/2] }
      end
    end
  end

  style :arrow do
    variants do
      position do
        top { %w[bottom-[-3px] left-1/2 -translate-x-1/2] }
        bottom { %w[top-[-3px] left-1/2 -translate-x-1/2] }
        right { %w[left-[-3px] top-1/2 -translate-y-1/2] }
        left { %w[right-[-3px] top-1/2 -translate-y-1/2] }
      end
    end
  end

  attr_reader :position

  def initialize(position: :top)
    super
    @position = position
  end
end
