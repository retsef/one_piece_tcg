module Arena
  class Hand::Component < BaseComponent
    renders_many :cards, Arena::HandCard::Component

    def rotation_for(index = 0)
      return 0 if total <= 2

      (index - ((total - 1).to_f / 2)) / (total - 2) * rotation_range
    end

    def offset_for(index = 0)
      return 0 if total <= 2

      ((index - ((total - 1).to_f / 2)) / (total - 2) * offset_range).abs
    end

    private

      def total
        cards.size
      end

      def rotation_range
        50
      end

      def offset_range
        80
      end
  end
end
