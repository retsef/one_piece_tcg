require 'test_helper'

class Card::Leader::OP04Test < ActiveSupport::TestCase
  EFFECT = [
    "This Leader cannot attack.[Activate: Main] [Once Per Turn] ➁ (You may rest the specified number of DON!! cards in your cost area.): Draw 1 card and up to 1 of your Characters gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[End of Your Turn] Set up to 2 of your DON!! cards as active.",
    "[DON!! x1] [Your Turn] Give all of your opponent's Characters −1 cost.[End of Your Turn] ➀ (You may rest the specified number of DON!! cards in your cost area.): Set up to 1 of your Characters with a cost of 5 or less as active.",
    "This Leader cannot attack.[Activate: Main] [Once Per Turn] ➀ (You may rest the specified number of DON!! cards in your cost area.): If you have 6 or less cards in your hand, look at 2 cards from the top of your deck; reveal up to 1 {Dressrosa} type card and add it to your hand. Then, trash the rest.",
    "[DON!! x1] [When Attacking] If you have a total of 4 or less cards in your Life area and hand, draw 1 card. If you have a Character with a cost of 8 or more, you may add up to 1 card from the top of your deck to the top of your Life cards instead of drawing 1 card.",
    "[Opponent's Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck by your effect, add up to 1 DON!! card from your DON!! deck and set it as active."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
