require 'test_helper'

class Card::Character::ST12Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may rest this Character: Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[On Play] If you have 2 or less Characters, play up to 1 {Muggy Kingdom} type or <Slash> attribute Character card with a cost of 4 or less other than [Dracule Mihawk] from your hand rested.",
    "-",
    "[DON!! x1] [When Attacking] Choose one:• Rest up to 1 of your opponent's Characters with a cost of 2 or less.• K.O. up to 1 of your opponent's rested Characters with a cost of 2 or less.",
    "[On Play] ➁ (You may rest the specified number of DON!! cards in your cost area.): If your opponent has 3 or more Life cards, set up to 1 of your <Slash> attribute Characters with a cost of 4 or less as active.",
    "[DON!! x1] [When Attacking] Rest up to 1 of your opponent's Characters with a cost of 6 or less.",
    "[On Play] Reveal 1 card from the top of your deck and play up to 1 Character card with a cost of 2. Then, place the rest at the top or bottom of your deck.[When Attacking] [Once Per Turn] Draw 1 card if you have 6 or less cards in your hand.",
    "[DON!! x1] [When Attacking] If you have 5 or less cards in your hand, this Character gains +2000 power until the start of your next turn.",
    "[Activate: Main] Return this Character to the owner's hand.",
    "[On Play] Look at 3 cards from the top of your deck and place them at the top or bottom of the deck in any order.[When Attacking] Reveal 1 card from the top of your deck and play up to 1 Character card with a cost of 2 rested. Then, place the rest at the top or bottom of your deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Look at 3 cards from the top of your deck and place them at the top or bottom of the deck in any order."
  ].freeze

  TRIGGER = [
    "Play this card.",
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
