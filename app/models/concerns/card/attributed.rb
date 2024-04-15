module Card::Attributed
  extend ActiveSupport::Concern

  ELEMENTS = %w[strike special wisdom slash ranged shoot].freeze

  included do
    serialize :elements # , coder: Attribute

    def element=(value)
      self.elements = [value]
    end

    def element
      elements.first
    end

    def multielement?
      elements.size > 1
    end

    ELEMENTS.each do |element|
      define_method :"#{element}?" do
        elements.include?(element)
      end

      scope element, -> { where('elements LIKE ?', "%#{element}%") }
    end
  end

  class Attribute
    def self.dump(value)
      value.to_s
    end

    def self.load(value)
      value.to_sym
    end

    def to_s
      value
    end

    def inspect
      to_s
    end

    def image
      icon_index = Attributed::ELEMENTS.index(value) || 0
      "https://en.onepiece-cardgame.com/images/cardlist/attribute/ico_type#{format('%02d', icon_index)}.png"
    end
  end
end
