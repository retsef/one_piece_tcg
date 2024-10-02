require 'test_helper'

class Card::Character::ST03Test < ActiveSupport::TestCase
  EFFECT = [
    "-",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x1] [On Block] Place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    "[On Play] Add up to 1 {The Seven Warlords of the Sea} or {Thriller Bark Pirates} type Character with a cost of 4 or less other than [Gecko Moria] from your trash to your hand.",
    "[DON!! x1] [When Attacking] Draw 2 cards and trash 2 cards from your hand.",
    "[DON!! x1] [Activate: Main] [Once Per Turn] ➁ (You may rest the specified number of DON!! cards in your cost area.): Play up to 1 [Pacifista] with a cost of 4 or less from your deck, then shuffle your deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Return up to 1 Character with a cost of 7 or less to the owner's hand.",
    "[On Play] Look at 3 cards from the top of your deck and return them to the top or bottom of the deck in any order.",
    "[On Play] Return up to 1 Character with a cost of 3 or less to the owner's hand."
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
