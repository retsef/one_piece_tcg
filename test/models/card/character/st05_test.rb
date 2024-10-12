require 'test_helper'

class Card::Character::ST05Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Block] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[Activate: Main] [Once Per Turn] You may rest this Character and trash 1 {FILM} type card from your hand: If your opponent has more DON!! cards on their field than you, add 2 DON!! cards from your DON!! deck and rest them.",
    "[When Attacking] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Draw 2 cards.",
    "-",
    "If you have 8 or more DON!! cards on your field, this Character cannot be K.O.'d in battle.",
    "When this Character battles ＜Strike＞ attribute Characters, this Character gains +3000 power during this turn.[Activate: Main] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains +2000 power during this turn.",
    "[Activate: Main] [Once Per Turn] DON!! −4 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 2 of your opponent's Characters with a cost of 6 or less. Then, this Character gains [Double Attack] during this turn.(This card deals 2 damage.)",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {FILM} type card other than [Buena Festa] and add it to your hand. Then, place the rest at the bottom of your deck in any order."
  ].freeze

  TRIGGER = [
    "",
    "Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST05")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST05")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
