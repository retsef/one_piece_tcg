require 'test_helper'

class Card::Event::ST12Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main]/[Counter] Rest up to 1 of your opponent's Leader or Character cards with a cost of 4 or less.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, reveal 1 card from the top of your deck, play up to 1 Character card with a cost of 2, and place the rest at the top or bottom of your deck."
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
