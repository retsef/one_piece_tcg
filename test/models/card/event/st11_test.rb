require 'test_helper'

class Card::Event::ST11Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] If your Leader is [Uta], choose one:• Rest up to 1 of your opponent's Characters with a cost of 5 or less.• K.O. up to 1 of your opponent's rested Characters with a cost of 5 or less.",
    "[Main] If your Leader is [Uta], look at 3 cards from the top of your deck; reveal up to 1 {FILM} type card other than [New Genesis] and add it to your hand. Then, place the rest at the bottom of your deck in any order and set up to 1 of your DON!! cards as active.",
    "[Main] Set up to 1 of your [Uta] Leader as active."
  ].freeze

  TRIGGER = [
    "",
    "Up to 1 of your Leader or Character cards gains +1000 power during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST11")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST11")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
