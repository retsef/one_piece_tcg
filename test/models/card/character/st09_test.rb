require 'test_helper'

class Card::Character::ST09Test < ActiveSupport::TestCase
  EFFECT = [
    "-",
    "[DON!! x1] If you have 2 or less Life cards, this Character cannot be K.O.'d in battle.",
    "[DON!! x1] This Character gains [Double Attack].(This card deals 2 damage.)[On K.O.] You may trash 2 cards from your hand: Add up to 1 card from the top of your deck to the top of your Life cards.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Block] You may add 1 card from the top or bottom of your Life cards to your hand: This Character gains +4000 power during this battle.",
    "[DON!! x1] [When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: Play up to 1 yellow {Land of Wano} type Character card with a cost of 4 or less from your hand.",
    "[Once Per Turn] If this Character would be K.O.'d, you may trash 1 card from the top or bottom of your Life cards instead.",
    "[When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: This Character gains +2000 power until the start of your next turn."
  ].freeze

  TRIGGER = [
    "Rest up to 1 of your opponent's Characters with a cost of 2 or less and add this card to your hand.",
    "",
    "K.O. up to 1 of your opponent's Characters with a cost of 1 or less and add this card to your hand."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST09")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST09")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
