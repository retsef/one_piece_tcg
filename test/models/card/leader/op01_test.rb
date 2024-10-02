require 'test_helper'

class Card::Leader::OP01Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [Your Turn] All of your Characters gain +1000 power.",
    "[Activate: Main] [Once Per Turn] ➁ (You may rest the specified number of DON!! cards in your cost area.): If you have 5 Characters, return 1 of your Characters to the owner's hand. Then, play up to 1 Character with a cost of 5 or less from your hand that is a different color than the returned Character.",
    "[Activate: Main] [Once Per Turn] ➃ (You may rest the specified number of DON!! cards in your cost area.): Set up to 1 of your {Supernovas} or {Straw Hat Crew} type Character cards with a cost of 5 or less as active. It gains +1000 power during this turn.",
    "[Activate: Main] [Once Per Turn] You can trash 1 {Land of Wano} type card from your hand: Set up to 2 of your DON!! cards as active.",
    "[DON!! x2] [When Attacking] ➀ (You may rest the specified number of DON!! cards in your cost area.): Reveal 1 card from the top of your deck. If that card is a {The Seven Warlords of the Sea} type Character card with a cost of 4 or less, you may play that card rested.",
    "[DON!! x1] [Your Turn] [Once Per Turn] When your opponent's Character is K.O.'d, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[DON!! x1] When you activate an Event, you may draw 1 card if you have 4 or less cards in your hand and haven't drawn a card using this Leader's effect during this turn.",
    "[Your Turn] If you have 10 DON!! cards on your field, give all of your opponent's Characters −1000 power."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
