require 'test_helper'

class Card::Leader::OP02Test < ActiveSupport::TestCase
  EFFECT = [
    "[End of Your Turn] Add 1 card from the top of your Life cards to your hand.",
    "[Your Turn] When this Leader or any of your Characters is given a DON!! card, give up to 1 of your opponent's Characters with a cost of 7 or less −1 cost during this turn.",
    "[Activate: Main] [Once Per Turn] If you have 1 or less Characters, the next time you play a {Land of Wano} type Character card with a cost of 3 or more from your hand during this turn, the cost will be reduced by 1.",
    "[Once Per Turn] When you play a Character with no base effect from your hand, if you have 3 or less Characters, set up to 2 of your DON!! cards as active.",
    "[End of Your Turn] If you have 0 cards in your hand, draw 2 cards.",
    "[Your Turn] [Once Per Turn] When a DON!! card on the field is returned to your DON!! deck, this Leader gains +1000 power during this turn.",
    "[When Attacking] DON!! −4 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 3 or less. Then, this Leader gains +1000 power during this turn.",
    "[DON!! x1] [Activate: Main] [Once Per Turn] Give up to 1 of your opponent's Characters −1 cost during this turn. Then, if there is a Character with a cost of 0, this Leader gains +1000 power during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP02")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
