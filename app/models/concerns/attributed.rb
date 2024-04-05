module Attributed
  extend ActiveSupport::Concern

  ELEMENTS = %w[strike special wisdom slash ranged shoot].freeze

  included do
    serialize :elements

    def element=(value)
      self.elements = [value]
    end

    def element
      elements.first
    end
  end
end
