module Colored
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
  end
end
