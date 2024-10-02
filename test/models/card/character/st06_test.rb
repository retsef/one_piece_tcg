require 'test_helper'

class Card::Character::ST06Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 0.",
    "-",
    "This Character cannot be K.O.'d by effects.[DON!! x1] If there is a Character with a cost of 0, this Character gains [Double Attack].(This card deals 2 damage.)",
    "[When Attacking] Give up to 1 of your opponent's Characters −4 cost during this turn.",
    "[Activate: Main] You may rest this Character: Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Give up to 1 of your opponent's Characters −4 cost during this turn.",
    "[On Play] Give up to 1 of your opponent's Characters −3 cost during this turn.",
    "[Activate: Main] You may trash 1 card from your hand and rest this Character: K.O. up to 1 of your opponent's Characters with a cost of 4 or less."
  ].freeze

  TRIGGER = [
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
