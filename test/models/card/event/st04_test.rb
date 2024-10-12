require 'test_helper'

class Card::Event::ST04Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] Draw 1 card, then add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Main] K.O. up to 1 of your opponent's Characters with a cost of 6 or less, then add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Up to 1 of your Leader or Character cards gains +4000 power during this battle."
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    "Add up to 1 DON!! card from your DON!! deck and set it as active.",
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST04")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST04")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
