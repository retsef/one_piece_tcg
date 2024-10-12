require 'test_helper'

class Card::Event::ST05Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[Counter] Up to 1 of your {FILM} type Leader or Character cards gains +4000 power during this battle. If that card is a Character, that Character cannot be K.O.'d during this turn."
  ].freeze

  TRIGGER = [
    "Add up to 1 DON!! card from your DON!! deck and set it as active."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST05")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST05")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
