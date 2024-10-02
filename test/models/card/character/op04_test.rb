require 'test_helper'

class Card::Character::OP04Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may rest this Character and give your 1 active Leader −5000 power during this turn: Look at 5 cards from the top of your deck; reveal up to 1 {Alabasta} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On K.O.] K.O. up to 1 of your opponent's Characters with 5000 base power or less.",
    "[Activate: Main] You may rest this Character: Give up to 1 rested DON!! card to each of your {Alabasta} type Characters.",
    "If you have a [Kung Fu Jugon] other than this Character, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[When Attacking] You may give your 1 active Leader −5000 power during this turn: This Character gains +2000 power until the start of your next turn.",
    "-",
    "[DON!! x1] [When Attacking] If your Leader is [Nefeltari Vivi], give up to 1 of your opponent's Characters −3000 power during this turn. Then, K.O. up to 1 of your opponent's Characters with 0 power or less.",
    "[When Attacking] You may give your 1 active Leader −5000 power during this turn: Return this Character to the owner's hand at the end of this turn.",
    "[On Play] Play up to 1 {Animal} type Character card with 3000 power or less from your hand.",
    "[When Attacking] Reveal 1 card from the top of your deck. If the revealed card is a Character card with 6000 power or more, this Character gains +3000 power during this turn. Then, place the revealed card at the bottom of your deck.",
    "[Your Turn] All of your {Alabasta} type Characters other than this Character gain +1000 power.",
    "[DON!! x1] [When Attacking] K.O. up to 1 of your opponent's Characters with 4000 power or less.",
    "[Banish] (When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[On Play] Give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[On Your Opponent's Attack] ➁ (You may rest the specified number of DON!! cards in your cost area.): Rest up to 1 of your opponent's DON!! cards.",
    "[Activate: Main] You may rest this Character: Rest up to 1 of your opponent's Characters with a cost of 1 or less.",
    "[Opponent's Turn] [Once Per Turn] When your opponent plays a Character, if your Leader has the {Donquixote Pirates} type, rest up to 1 of your opponent's Characters. Then, rest this Character.[On Play] Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[On Your Opponent's Attack] ➁ (You may rest the specified number of DON!! cards in your cost area.): Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[When Attacking] ➀ (You may rest the specified number of DON!! cards in your cost area.): If your Leader has the {Donquixote Pirates} type, rest up to 1 of your opponent's Characters with a cost of 4 or less. Then, set up to 1 of your DON!! cards as active at the end of this turn.",
    "[DON!! x1] [End of Your Turn] Set this Character as active.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x1] [End of Your Turn] If you have 2 or more active DON!! cards, set this Character as active.",
    "[End of Your Turn] Set up to 1 of your DON!! cards as active.",
    "[On Play] K.O. up to 1 of your opponent's rested Characters with a cost of 5 or less.[On Your Opponent's Attack] ➁ (You may rest the specified number of DON!! cards in your cost area.): Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[On Play] Up to a total of 3 of your opponent's rested Leader and Character cards will not become active in your opponent's next Refresh Phase.",
    "[End of Your Turn] You may trash this Character: Set up to 2 of your DON!! cards as active.",
    "[On Play] If your Leader has the {Donquixote Pirates} type, rest up to 1 of your opponent's Characters with a cost of 5 or less. Then, set up to 1 of your DON!! cards as active at the end of this turn.",
    "[End of Your Turn] If you have 3 or more active DON!! cards, K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "[On Play] You may trash 2 cards from your hand: Look at 5 cards from the top of your deck; reveal up to 1 {East Blue} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] Up to 1 of your  attribute Characters gains +3000 power during this turn. Then, trash 1 card from the top of your deck.",
    "[DON!! x1] [When Attacking] Return up to 1 Character with a cost of 2 or less to the owner's hand or the bottom of their deck.",
    "[On Play] Return up to 1 Character with a cost of 8 or less and up to 1 Character with a cost of 3 or less to the owner's hand.",
    "[On Play] Draw 1 card.",
    "[On Play] If your Leader has the {Animal Kingdom Pirates} type, look at 7 cards from the top of your deck; reveal a total of up to 2 [Plague Rounds] or [Ice Oni] cards and add them to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Your Turn] At the end of a battle in which this Character battles your opponent's Character with a cost of 5 or less, place the opponent's Character you battled with at the bottom of the owner's deck.",
    "[On Play] Return all cards in your hand to your deck and shuffle your deck. Then, draw cards equal to the number you returned to your deck.",
    "[On K.O.] Draw 1 card.",
    "[Activate: Main] You may trash 1 card from your hand and rest this Character: Draw 1 card.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Animal Kingdom Pirates} type card other than [Who's.Who] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] ➁ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Character: Draw 1 card.",
    "[DON!! x1] [Once Per Turn] When you activate an Event, draw 1 card. Then, place 1 card from your hand at the bottom of your deck.",
    "[On Your Opponent's Attack] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Water Seven} type, this Character gains [Blocker] during this turn.(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader's type includes \"Baroque Works\", add up to 1 card from the top of your deck to the top of your Life cards.[On Your Opponent's Attack] [Once Per Turn] DON!! −1: Draw 1 card and trash 1 card from your hand.",
    "[Activate: Main] You may trash this Character: If your Leader has the {Water Seven} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Your Opponent's Attack] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Water Seven} type, up to 1 of your Leader or Character cards gains +1000 power during this battle.",
    "[On Play] Add up to 1 DON!! card from your DON!! deck and rest it. Then, if you have 6 or more DON!! cards on your field, draw 1 card.",
    "[On Play] If your Leader's type includes \"Baroque Works\", up to 1 of your opponent's Characters with a cost of 5 or less cannot attack until the start of your next turn.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 card with a type including \"Baroque Works\" and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Your Opponent's Attack] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Return up to 1 of your opponent's Characters with a cost of 2 or less to the owner's hand.",
    "[On Your Opponent's Attack] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character's base power becomes the same as the power of your opponent's attacking Leader or Character during this turn.",
    "[On Your Opponent's Attack] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Give up to 1 of your opponent's Characters −1000 power during this turn.",
    "[On Your Opponent's Attack] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains [Blocker] and +1000 power during this battle.(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Your Opponent's Attack] [Once Per Turn] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may rest this Character: K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Activate: Main] You may trash this Character and 1 of your Characters with a type including \"Baroque Works\": Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Activate: Main] [Once Per Turn] Give up to 1 of your opponent's Characters −4 cost during this turn and trash 2 cards from the top of your deck. Then, K.O. 1 of your {Dressrosa} type Characters.",
    "[On Play] Up to 1 of your {Dressrosa} type Characters can also attack active Characters during this turn.",
    "[DON!! x1] This Character can also attack active Characters.[When Attacking] You may rest your Leader: K.O. up to 1 of your opponent's Characters with a cost of 1 or less. Then, trash 2 cards from the top of your deck.",
    "If this Character would be K.O.'d, you may rest your Leader or 1 [Corrida Coliseum] instead.[On Play] If your Leader is [Rebecca], K.O. up to 1 of your opponent's Characters with a cost of 1 or less. Then, trash 1 card from the top of your deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] None of your Characters can be K.O.'d by effects until the start of your next turn. Then, draw 2 cards and trash 2 cards from your hand.",
    "[On Play] Look at 3 cards from the top of your deck and play up to 1 Character card with a type including \"CP\" other than [Stussy] and a cost of 2 or less. Then, trash the rest.",
    "[On Play]/[When Attacking] If your Leader has the {Dressrosa} type, give up to 1 of your opponent's Characters −2 cost during this turn. Then, trash 1 card from the top of your deck.",
    "[DON!! x1] When this Character battles and K.O.'s your opponent's Character, draw 2 cards and trash 2 cards from your hand.",
    "[Activate: Main] You may rest your 1 Leader: Give up to 1 of your opponent's Characters −4 cost during this turn.",
    "This Character can also attack active Characters.[Activate: Main] [Once Per Turn] You may return 7 cards from your trash to the bottom of your deck in any order: Set this Character as active. Then, this Character will not become active in your next Refresh Phase.",
    "[On Play] You may rest your 1 Leader: If your Leader has the {Dressrosa} type, K.O. up to 1 of your opponent's Characters with a cost of 1 or less. Then, trash 2 cards from the top of your deck.",
    "[On Play] Look at 3 cards from the top of your deck; reveal up to 1 {Dressrosa} type card other than [Rebecca] and add it to your hand. Then, trash the rest.",
    "[On Play] Add up to 1 of your opponent's {Animal} or {SMILE} type Characters with a cost of 3 or less to the top of your opponent's Life cards face-up.",
    "[On Play] You may trash 2 {Land of Wano} type cards from your hand: If you have 1 or less Life cards, add 1 card from the top of your deck to the top of your Life cards.",
    "Also treat this card's name as [Charlotte Linlin] according to the rules.",
    "[Your Turn] [On Play] Draw 1 card.",
    "[Activate: Main] [Once Per Turn] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may add 1 card from the top or bottom of your Life cards to your hand: Set this Character as active.",
    "[On Play] Up to 1 of your {Land of Wano} type Leader or Character cards gains +1000 power during this turn.",
    "[Activate: Main] [Once Per Turn] You may trash 1 card with a [Trigger] from your hand: Rest up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[DON!! x1] If you have less Life cards than your opponent, this Character gains +1000 power.",
    "[DON!! x1] This Character gains [Banish].(When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[Activate: Main] You may trash this Character: Up to 1 of your {Land of Wano} type Leader or Character cards gains +3000 power during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] Add up to 1 of your opponent's Characters with a cost of 3 or less to the top or bottom of your opponent's Life cards face-up.",
    "[Activate: Main] You may trash 1 of your {Homies} type Characters other than this Character and rest this Character: Set up to 1 of your [Charlotte Linlin] Characters as active.",
    "[On Play] K.O. up to 1 of your opponent's Characters with a cost equal to or less than the total of your and your opponent's Life cards. Then, if you have 1 or less Life cards, add up to 1 card from the top of your deck to the top of your Life cards.",
    "All of your red Characters with a cost of 3 or more other than this Character gain [Rush].(This card can attack on the turn in which it is played.)",
    "[Opponent's Turn] If this Character is rested, your active Characters with a base cost of 5 cannot be K.O.'d by effects.[On Play] You may rest this Character: Play up to 1 green Character card with a cost of 5 from your hand."
  ].freeze

  TRIGGER = [
    "",
    "Play this card.",
    "DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "DON!! −1: Play this card.",
    "If you have 1 or less Life cards, play this card.",
    "Up to 1 of your opponent's Leader or Character cards cannot attack during this turn.",
    "Play this card. Then, K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "You may trash 1 card from your hand: Play this card."
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
