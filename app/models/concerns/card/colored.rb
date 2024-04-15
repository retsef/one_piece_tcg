module Card::Colored
  extend ActiveSupport::Concern

  COLORS = %w[red green blue purple yellow black].freeze

  included do
    serialize :colors

    def color=(value)
      raise ArgumentError unless COLORS.include?(value)

      self.colors = [value]
    end

    def color
      colors.first
    end

    def multicolor?
      colors.size > 1
    end

    COLORS.each do |color|
      define_method :"#{color}?" do
        colors.include?(color)
      end

      scope color, -> { where('colors LIKE ?', "%#{color}%") }
    end
  end
end
