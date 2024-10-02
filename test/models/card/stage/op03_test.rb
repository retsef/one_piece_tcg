require 'test_helper'

class Card::Stage::OP03Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] ② (You may rest the specified number of DON!! cards in your cost area.) You may rest this Stage: If your Leader is [Portgas.D.Ace], look at 5 cards from the top of your deck; reveal up to 1 Event and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] You may rest this Stage: If your Leader is [Iceburg], add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Activate: Main] You may rest this Stage: If your Leader's type includes \"CP\", give up to 1 of your opponent's Characters −2 cost during this turn."
  ].freeze

  TRIGGER = [
    "",
    "Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
