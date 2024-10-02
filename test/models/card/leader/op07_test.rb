require 'test_helper'

class Card::Leader::OP07Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] Give up to 2 total of your currently given DON!! cards to 1 of your Characters.",
    "[On Your Opponent's Attack] [Once Per Turn] ➀ (You may rest the specified number of DON!! cards in your cost area.): Rest up to 1 of your opponent's Leader or Character cards.",
    "[Your Turn] [Once Per Turn] This effect can be activated when a Character is removed from the field by your effect. If you have 5 or less cards in your hand, draw 1 card.",
    "[When Attacking] DON!! −3 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If you have 3 or more {Foxy Pirates} type Characters, select your opponent's rested Leader and up to 1 Character card. The selected cards will not become active in your opponent's next Refresh Phase.",
    "[When Attacking] You may trash 2 cards from the top of your deck: Give up to 1 of your opponent's Characters −1 cost during this turn.",
    "This Leader cannot attack.[Activate: Main] [Once Per Turn] ① (You may rest the specified number of DON!! cards in your cost area.): Select up to 1 {Egghead} type card with a cost of 5 or less from your hand and play it or add it to the top of your Life cards face-up."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
