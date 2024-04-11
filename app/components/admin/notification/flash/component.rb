module Admin::Notification
  class Flash::Component < BaseComponent
    style do
      variants do
        color do
          info { 'text-sky-400' }
          notice { 'text-green-400' }
          warning { 'text-yellow-400' }
          success { 'text-green-400' }
          error { 'text-red-400' }
        end
      end
      defaults { { color: :info } }
    end

    attr_reader :type, :value

    def initialize(type = :info, value = '')
      super

      @type = type.to_sym
      @value = value
    end

    def icon
      case type.to_sym
      when :notice, :success then 'heroicons/24/outline/check-circle.svg'
      when :warning then 'heroicons/24/outline/exclamation-triangle.svg'
      when :error then 'heroicons/24/outline/exclamation-circle.svg'
      else 'heroicons/24/outline/question-mark-circle.svg'
      end
    end

    def render?
      value.present?
    end
  end
end
