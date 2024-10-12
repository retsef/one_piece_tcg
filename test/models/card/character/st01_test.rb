require 'test_helper'

class Card::Character::ST01Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x2] [When Attacking] Your opponent cannot activate a [Blocker] Character that has 5000 or more power during this battle.",
    "-",
    "[DON!! x2] This Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[DON!! x1] [When Attacking] Up to 1 of your Leader or Character cards other than this card gains +1000 power during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[Activate: Main] [Once Per Turn] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.",
    "[On Play] Give up to 2 rested DON!! cards to your Leader or 1 of your Characters.",
    "[Rush] (This card can attack on the turn in which it is played.)[DON!! x2] [When Attacking] Your opponent cannot activate [Blocker] during this battle.",
    "[DON!! x1] This Character gains +1000 power."
  ].freeze

  TRIGGER = [
    "Play this card.",
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST01")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST01")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
