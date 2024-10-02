require 'test_helper'

class Card::Event::ST13Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, look at all your Life cards and place them back in your Life area in any order.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if you have 0 Life cards, draw 1 card.",
    "[Main] Look at 5 cards from the top of your deck; reveal up to 1 [Sabo], [Portgas.D.Ace], or [Monkey.D.Luffy] with a cost of 5 or less and add it to your hand. Then, place the rest at the bottom of your deck in any order."
  ].freeze

  TRIGGER = [
    "You may add 1 card from the top or bottom of your Life cards to your hand: Add up to 1 card from your hand to the top of your Life cards.",
    "Activate this card's [Main] effect."
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
