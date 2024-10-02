require 'test_helper'

class Card::Leader::OP08Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] Give up to 3 of your {Animal} or {Drum Kingdom} type Characters up to 1 rested DON!! card each.",
    "[DON!! x1] [Activate: Main] [Once Per Turn] Draw 1 card and place 1 card from your hand at the top or bottom of your deck. Then, give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[Activate: Main] [Once Per Turn] If you have a {Minks} type Character, rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[Activate: Main] [Once Per Turn] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Choose one:• If you have 5 or less cards in your hand, draw 1 card.• Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[When Attacking] You may turn 2 cards from the top of your Life cards face-up: Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[DON!! x1] [When Attacking] Play up to 1 {Shandian Warrior} type Character card from your hand with a cost equal to or less than the number of DON!! cards on your field. If you do, add 1 card from the top of your Life cards to your hand."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
