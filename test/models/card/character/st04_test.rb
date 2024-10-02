require 'test_helper'

class Card::Character::ST04Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 [Page One] card with a cost of 4 or less from your hand.",
    "[On Play] DON!! −5 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 6 or less. This Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Draw 2 cards and trash 1 card from your hand.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Draw 1 card.",
    "-",
    "[On Play] You may trash 1 card from your hand: Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)"
  ].freeze

  TRIGGER = [
    "",
    "Play this card."
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
