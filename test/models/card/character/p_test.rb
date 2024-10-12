require 'test_helper'

class Card::Character::PTest < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x2] This Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[DON!! x2] This Character gains [Double Attack].(This card deals 2 damage.)",
    "[DON!! x1] This Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[Activate: Main]  DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains [Banish] during this turn.(When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[DON!! x2] [Your Turn] This Character gains +2000 power.",
    "[DON!! x1] This Character cannot be K.O.'d in battle by ＜Strike＞ attribute Leaders or Characters.",
    "[Activate: Main] You may rest this Character: Rest 1 of your opponent's Characters with a cost of 2 or less.",
    "[On Play] If your opponent has 6 or more cards in their hand, your opponent adds 1 card from their Life area to their hand.",
    "[End of Your Turn] Add 1 DON!! card from your DON!! deck and set it as active.",
    "-",
    "[Activate: Main] You may place this Character at the bottom of the owner's deck: Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[DON!! x1] [When Attacking] K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[On Play] Up to 1 of your Leader or Character cards gains +1000 power during this turn.",
    "[DON!! x1] This Character cannot be K.O.'d in battle by Characters without the <Special> attribute.",
    "[When Attacking] Give up to 1 of your opponent's Characters −3 cost during this turn.",
    "Also treat this card's name as [Franky] according to the rules.[Opponent's Turn] All of your Characters with 3000 base power or less gain +1000 power.",
    "[Double Attack] (This card deals 2 damage.)",
    "[End of Your Turn] You may rest this Character: Set up to 1 of your {FILM} type Characters other than [Bartolomeo] as active.",
    "[On K.O.] Place up to 1 Character with a cost of 3 or less at the bottom of the owner's deck.",
    "[On Play] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[DON!! x1] [Your Turn] Give all of your opponent's Characters −2 cost.",
    "[Activate: Main] You may place this Character at the bottom of the owner's deck: Draw 1 card.",
    "[DON!! x1] [Your Turn] If you have 2 or less Life cards, this Character gains +2000 power.",
    "[DON!! x1] [When Attacking] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 0.",
    "[When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: This Character and up to 1 of your Leader gain +1000 power during this turn.",
    "[When Attacking] If you have 2 or more rested Characters, this Character gains +1000 power during this turn.",
    "[Banish] (When this card deals damage, the target card is trashed without activating its Trigger.)[DON!! x2] If you have 0 Life cards, this Character gains +2000 power.",
    "[On Play] Return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "[Banish] (When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[On Play] You may place all cards in your hand at the bottom of your deck in any order. If you do, draw cards equal to the number you placed at the bottom of your deck.",
    "[DON!! x1] [When Attacking] If you have 4 or more Life cards, your opponent places 1 card from their hand at the bottom of their deck.",
    "[On Play] Look at 5 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x1] [Your Turn] If you have 3 or less cards in your hand, this Character gains +4000 power.",
    "[When Attacking] You may trash any number of cards from your hand. This Character gains +1000 power during this battle for every card trashed.",
    "[DON!! x1] This Character cannot be K.O.'d in battle by <Slash> attribute cards.",
    "[On Play] If you have 3 or less cards in your hand, return up to 1 of your opponent's Characters with a cost of 3 or less to the owner's hand.",
    "[DON!! x1] This Character cannot be K.O.'d in battle by <Strike> attribute cards.",
    "[On Play] You may trash 2 cards from your hand: Your opponent places 1 of their Characters at the bottom of the owner's deck.",
    "[On Play] ➁ (You may rest the specified number of DON!! cards in your cost area.): Return up to 1 Character with a cost of 5 or less to the owner's hand.",
    "[Activate: Main] [Once Per Turn] Rest up to 1 of your opponent's Characters with a cost of 4 or less and this Character gains +1000 power during this turn. Then, add 1 card from the top of your Life cards to your hand.",
    "[When Attacking] If your opponent has a Character with a cost of 0, this Character gains +2000 power until the start of your next turn.",
    "[Activate: Main] You may trash this Character: Look at 5 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[Activate: Main] [Once Per Turn] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.",
    "[On K.O.] You may add this Character card to your hand."
  ].freeze

  TRIGGER = [
    "",
    "Play this card.",
    "K.O. up to 1 of your opponent's Characters with a cost of 4 or less."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("P")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("P")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
