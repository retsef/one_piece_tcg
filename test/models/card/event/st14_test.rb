require 'test_helper'

class Card::Event::ST14Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] If you have a Character with a cost of 8 or more, up to 1 of your Leader or Character cards gains +3000 power during this battle.",
    "[Main] Up to 1 of your Leader or Character cards gains +3000 power during this turn. Then, if you have a Character with a cost of 8 or more, K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Main] Draw 1 card. Then, up to 1 of your Characters gains +3 cost until the end of your opponent's next turn."
  ].freeze

  TRIGGER = [
    "Add up to 1 of your Character cards with a cost of 2 or less from your trash to your hand.",
    "If you have a Character with a cost of 8 or more, K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "K.O. up to 1 of your opponent's Characters with a cost of 3 or less."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST14")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST14")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
