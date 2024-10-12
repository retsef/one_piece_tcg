require 'test_helper'

class Card::Leader::ST10Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] DON!! −3 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Place up to 1 of your opponent's Characters with 3000 power or less at the bottom of the owner's deck, and play up to 1 Character card with a cost of 4 or less from your hand.",
    "[Activate: Main] [Once Per Turn] If you have 0 DON!! cards on your field or 8 or more DON!! cards on your field, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Your Turn] If you have 4 or more Life cards, give this Leader −1000 power.[When Attacking] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Leader gains +2000 power during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST10")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
