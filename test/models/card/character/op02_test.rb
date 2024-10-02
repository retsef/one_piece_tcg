require 'test_helper'

class Card::Character::OP02Test < ActiveSupport::TestCase
  EFFECT = [
    "-",
    "[DON!! x1] [When Attacking] Rest up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may return this Character to the owner's hand: Play up to 1 Character with a cost of 3 from your hand.",
    "[On Play] Play up to 1 {FILM} or {Straw Hat Crew} type Character card with a cost of 2 or less from your hand.",
    "[On Play] Play up to 1 {FILM} or {Straw Hat Crew} type Character card with a cost of 3 or less from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Play up to 1 {FILM} or {Straw Hat Crew} type Character card with a cost of 4 or less from your hand.",
    "[On Play] Up to 1 of your Leader gains +2000 power until the start of your next turn. Then, you cannot add Life cards to your hand using your own effects during this turn.[DON!! x2] [When Attacking] K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[On Play] Look at up to 5 cards from the top of your deck; reveal up to 1 red Character with a cost of 1 and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[DON!! x1] If you have 2 or less Life cards and your Leader's type includes \"Whitebeard Pirates\", this Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[On Play] If your Leader's type includes \"Whitebeard Pirates\", give up to 1 of your opponent's Characters −4000 power during this turn and add 1 card from the top of your Life cards to your hand.",
    "[Activate: Main] You may rest this Character: Play up to 1 red Character other than [Dogura] with a cost of 1 from your hand.",
    "[On Play] K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Give up to 2 of your opponent's Characters −3000 power during this turn. Then, if your Leader's type includes \"Whitebeard Pirates\", this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[DON!! x1] This Character can also attack your opponent's active Characters.",
    "[Activate: Main] You may rest this Character: Up to 1 of your red Characters with a cost of 1 gains +3000 power during this turn.",
    "[On Play] Up to 1 of your red Characters with a cost of 1 gains +3000 power during this turn.",
    "[DON!! x2] [When Attacking] K.O. up to 1 of your opponent's Characters with 2000 power or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] You may trash 1 card with a type including \"Whitebeard Pirates\" from your hand: If you have 2 or less Life cards, play this Character card from your trash rested.",
    "[DON!! x1] [Your Turn] All of your Characters with a type including \"Whitebeard Pirates\" gain +1000 power.",
    "If all of your DON!! cards are rested, this Character cannot be removed from the field by your opponent's effects.",
    "[End of Your Turn] Set up to 1 of your DON!! cards as active.",
    "[Activate: Main] [Once Per Turn] ③ (You may rest the specified number of DON!! cards in your cost area.): Set this Character as active.[On K.O.] Play up to 1 green {Land of Wano} type Character card with a cost of 3 from your deck. Then, shuffle your deck.",
    "If you have a [Kouzuki Oden] Character, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] ② (You may rest the specified number of DON!! cards in your cost area.): Set up to 1 of your {Minks} type Characters with a cost of 5 or less as active.",
    "[On Play]/[When Attacking] ➀ (You may rest the specified number of DON!! cards in your cost area.): Look at 3 cards from the top of your deck; reveal up to 1 {FILM} type card other than [Nami] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "Also treat this card's name as [Kouzuki Oden] according to the rules.[On Play] Rest up to 1 of your opponent's Characters with a cost of 6 or less.",
    "[On Play] Play up to 1 {Minks} type Character card other than [Wanda] with a cost of 3 or less from your hand.",
    "If you have 1 or less cards in your hand, this Character gains +2000 power.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Draw card(s) so that you have 3 cards in your hand and then play up to 1 blue {Impel Down} type Character card with a cost of 6 or less from your hand.",
    "[On Play] If you have [Mohji], draw 2 cards and trash 1 card from your hand.",
    "[On Play] Look at 3 cards from the top of your deck and place them at the top or bottom of the deck in any order.[DON!! x1] [When Attacking] You may trash 1 card from your hand: Place up to 1 of your opponent's Characters with a cost of 1 or less at the bottom of the owner's deck.",
    "[On Play] Look at 2 cards from the top of your deck; reveal up to 1 {The Seven Warlords of the Sea} type card and add it to your hand. Then, place the rest at the top or bottom of the deck in any order.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 blue {Impel Down} type card other than [Buggy] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[When Attacking] Draw 1 card and trash 1 card from your hand. Then, trash up to 3 cards from your hand.",
    "[When Attacking] If you have 1 or less cards in your hand, your opponent cannot activate the [Blocker] of any Character with a cost of 5 or less during this battle.",
    "[On Play]/[When Attacking] You may trash 2 cards from your hand: Return up to 1 Character with a cost of 4 or less to the owner's hand. Then, this Character gains [Double Attack] during this turn.(This card deals 2 damage.)",
    "[On Play] Add up to 1 blue Event card with a cost of 1 from your trash to your hand.",
    "[DON!! x1] [When Attacking] You may trash 1 card from your hand: Place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck. Then, at the end of this battle, place this Character at the bottom of the owner's deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[End of Your Turn] You may trash 1 card from your hand: Set this Character as active.",
    "[On Play] Play up to 1 {Jailer Beast} type Character card from your hand.",
    "Your [Blugori] gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 1 or less.",
    "[On Play] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 {SMILE} type Character card other than [Daifugo] with a cost of 3 or less from your hand.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Activate: Main] DON!! −8 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains +792000 power during this turn.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 purple {Impel Down} type card other than [Hannyabal] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Your opponent returns 1 DON!! card from their field to their DON!! deck.[Opponent's Turn] When this Character is K.O.'d, your opponent returns 2 DON!! cards from their field to their DON!! deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] If your Leader has the {Impel Down} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Double Attack] (This card deals 2 damage.)[On K.O.] If your Leader has the {Impel Down} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[DON!! x1] [Once Per Turn] When this Character battles and K.O.'s your opponent's Character, set this Character as active.",
    "If there is a Character with a cost of 0, this Character gains [Banish].(When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[On Play] Draw 1 card.[When Attacking] Give up to 1 of your opponent's Characters −4 cost during this turn.",
    "[On Play] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[On Play] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "If you have [Fullbody], this Character cannot be K.O.'d in battle.",
    "[When Attacking] If there is a Character with a cost of 0, your opponent cannot activate the [Blocker] of any Character with a cost of 5 or less during this battle.",
    "This Character cannot be K.O.'d by effects.[When Attacking] If there is a Character with a cost of 0, this Character gains +2000 power during this battle.",
    "[DON!! x1] [When Attacking] Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[DON!! x1] [When Attacking] Give up to 1 of your opponent's Characters −3 cost during this turn.",
    "[On Play] Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Block] Select up to 1 of your opponent's Characters with a cost of 6 or less. The selected Character cannot attack during this turn.",
    "[When Attacking] If you have [Jango], this card gains +3000 power during this battle.",
    "[Activate: Main] You may rest this Character: Give up to 1 of your opponent's Characters −1 cost during this turn. Then, up to 1 of your Leader or Character cards gains +1000 power during this turn.",
    "[When Attacking] Give up to 1 of your opponent's Characters −2 cost during this turn. Then, if there is a Character with a cost of 0, this Character gains +2000 power during this battle.",
    "[Opponent's Turn] This Character gains +1000 power and cannot be K.O.'d by effects.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[DON!! x2] [When Attacking] K.O. up to 1 of your opponent's Characters with a cost of 0.",
    "[On Play] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Your Leader and all of your Characters gain +1000 power until the start of your next turn.",
    "[Your Turn] Give all of your opponent's Characters −5 cost.[On Play] K.O. up to 1 of your opponent's Characters with a cost of 0."
  ].freeze

  TRIGGER = [
    "",
    "DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
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
