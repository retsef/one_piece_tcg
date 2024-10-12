require 'test_helper'

class Card::Character::OP03Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [When Attacking] Your opponent cannot activate a [Blocker] Character that has 2000 or less power during this battle.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 card with a type including \"Whitebeard Pirates\" other than [Izo] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "This Character cannot attack a Leader on the turn in which it is played.[DON!! x1] This Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[Activate: Main] [Once Per Turn] This Character gains +2000 power during this turn. Then, trash this Character at the end of this turn.",
    "-",
    "This Character cannot be K.O.'d in battle by  attribute cards.[On Play] Look at 5 cards from the top of your deck; reveal up to 1 red Event and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] [Once Per Turn] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[DON!! x1] [When Attacking] Give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[When Attacking] You may trash 1 of your red Characters with 4000 power or more: Draw 1 card. Then, this Character gains +1000 power during this battle.",
    "[Your Turn] [On Play] K.O. up to 1 of your opponent's Characters with 3000 power or less.[On K.O.] You may trash 1 Event from your hand: You may play this Character card from your trash rested.",
    "[When Attacking] Play up to 1 red Character card with a cost of 1 from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Opponent's Turn] When this Character is K.O.'d, give up to 1 of your opponent's Leader or Character cards −2000 power during this turn.",
    "[On Play] If your Leader has the {East Blue} type, rest up to 2 of your opponent's Characters with a cost of 4 or less.",
    "[On Play] You may trash 1 card from your hand: K.O. up to 2 of your opponent's rested Characters with a cost of 4 or less.[DON!! x1] This Character gains [Double Attack].(This card deals 2 damage.)",
    "[On Play] If your Leader has the {East Blue} type, rest up to 1 of your opponent's Characters.",
    "[On Play] If your Leader has the {East Blue} type, rest up to 1 of your opponent's Characters with a cost of 2 or less and, if you don't have [Buchi], play up to 1 [Buchi] from your hand.",
    "[On Play] Choose one:• Set up to 1 of your {East Blue} type Leader or Character cards with a cost of 6 or less as active.• Rest this Character and up to 1 of your opponent's Characters.",
    "[On Play] K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 green {East Blue} type card other than [Nami] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "This Character cannot be K.O.'d in battle by  attribute cards.",
    "[On Play] K.O. up to 1 of your opponent's rested Characters with a cost of 2 or less.",
    "[Rush] (This card can attack on the turn in which it is played.)[DON!! x1] When this Character's attack deals damage to your opponent's Life, you may trash 7 cards from the top of your deck.",
    "[On Play] Add up to 1 blue [Usopp] from your trash to your hand.",
    "When you deal damage to your opponent's Life, you may trash 3 cards from the top of your deck. If you do, trash this Character.",
    "[On Play] Draw 2 cards and trash 2 cards from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Opponent's Turn] If you have 20 or less cards in your deck, this Character gains +3000 power.",
    "[DON!! x1] When this Character's attack deals damage to your opponent's Life, you may trash 7 cards from the top of your deck.[On Play] Return up to 1 Character with a cost of 3 or less to the owner's hand, and you may trash 2 cards from the top of your deck.",
    "[On Play] If your Leader is [Nami], return up to 1 of your opponent's Characters with a cost of 5 or less to the owner's hand.",
    "[On Play] If you have 20 or less cards in your deck, return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] You may trash 1 card from the top of your deck.",
    "[DON!! x1] When this Character's attack deals damage to your opponent's Life, you may trash 7 cards from the top of your deck.[On K.O.] You may trash 3 cards from the top of your deck.",
    "[DON!! x1] If you have 20 or less cards in your deck, this Character gains +2000 power.",
    "[When Attacking] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains [Banish] during this battle.(When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[When Attacking] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Draw 2 cards and trash 1 card from your hand.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Water Seven} type card other than [Kokoro] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Water Seven} type, draw 1 card.",
    "[On K.O.] If your Leader has the {Galley-La Company} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] ➁ (You may rest the specified number of DON!! cards in your cost area.): Add up to 1 DON!! card from your DON!! deck and set it as active. Then, if you have 8 or more DON!! cards on your field, K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[DON!! x1] [When Attacking] If your Leader has the {Galley-La Company} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Banish] (When this card deals damage, the target card is trashed without activating its Trigger.)[On K.O.] If your Leader has the {Impel Down} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On K.O.] If your Leader has the {Impel Down} type, draw 2 cards and trash 1 card from your hand.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may trash 1 Character card with a cost of 5 from your hand: This Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[When Attacking] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[DON!! x1] [Your Turn] Give all of your opponent's Characters −3 cost.[On Play] If your opponent has 6 or more cards in their hand, trash 2 cards from your opponent's hand.",
    "[DON!! x1] This Character cannot be K.O.'d in battle.",
    "[On Play] You may place 2 cards with a type including \"CP\" from your trash at the bottom of your deck in any order: K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[On Play] Draw 2 cards and trash 2 cards from your hand. Then, give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[On Play] Look at 5 cards from the top of your deck and trash up to 2 cards. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] If your Leader's type includes \"CP\", look at 3 cards from the top of your deck; reveal up to 1 card with a type including \"CP\" other than [Spandam] and add it to your hand. Then, trash the rest.",
    "This Character cannot be K.O.'d by effects.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Look at 3 cards from the top of your deck; reveal up to 1 {Navy} type card other than [Brannew] and add it to your hand. Then, trash the rest.",
    "[DON!! x1] This Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] Play up to 1 Character card with a type including \"CP\" and a cost of 4 or less from your trash rested.",
    "[On Play] Set the cost of up to 1 of your opponent's Characters with no base effect to 0 during this turn.",
    "[On Play] You may place 2 cards with a type including \"CP\" from your trash at the bottom of your deck in any order: This Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[On Play] You may trash 1 card from your hand: If your Leader's type includes \"CP\", K.O. up to 1 of your opponent's Characters with a cost of 1 or less.",
    "[DON!! x2] [When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: Add up to 1 card from the top of your deck to the top of your Life cards.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards.",
    "[DON!! x1] [When Attacking] You may trash 1 card with a [Trigger] from your hand: This Character gains +3000 power during this battle.",
    "[DON!! x1] If you have less Life cards than your opponent, this Character gains [Double Attack] and +1000 power.(This card deals 2 damage.)",
    "[On Play] You may trash 1 card from the top or bottom of your Life cards: Add up to 1 card from the top of your deck to the top of your Life cards.",
    "[When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: This Character gains +2000 power during this battle.",
    "[On Play] Look at 4 cards from the top of your deck; reveal up to 1 [Sanji] or {Big Mom Pirates} type card other than [Charlotte Pudding] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On K.O.] Look at 3 cards from the top of your deck; reveal up to 1 {Big Mom Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] If your Leader has the {Big Mom Pirates} type, add up to 1 card from the top of your deck to the top of your Life cards. Then, trash up to 1 card from the top of your opponent's Life cards.",
    "[On Play] You may trash 1 card with a [Trigger] from your hand: K.O. up to 1 of your opponent's Characters with a cost of 1 or less.",
    "[On Play] Draw 3 cards and trash 2 cards from your hand.",
    "[Activate: Main] You may rest this Character: Up to 1 of your [Charlotte Linlin] cards gains +1000 power until the start of your next turn.",
    "Also treat this card's name as [Usopp] according to the rules.[On Play] Return up to 1 Character with a cost of 6 or less to the owner's hand. Then, draw 2 cards and trash 2 cards from your hand.",
    "[On Play] Add up to 1 Character with a cost of 8 or less to the top or bottom of the owner's Life cards face-up."
  ].freeze

  TRIGGER = [
    "",
    "Play this card.",
    "If your Leader has the {East Blue} type, play this card.",
    "You may trash 1 card from the top or bottom of your Life cards: Play this card.",
    "You may trash 1 card from your hand: Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP03")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP03")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
