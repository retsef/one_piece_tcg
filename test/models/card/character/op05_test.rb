require 'test_helper'

class Card::Character::OP05Test < ActiveSupport::TestCase
  EFFECT = [
    "If you have a Character with 7000 power or more other than this Character, this Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[Activate: Main] [Once Per Turn] If this Character has 7000 power or more, play up to 1 {Revolutionary Army} type Character card with 5000 power or less other than [Emporio.Ivankov] from your hand.",
    "[On Play] If your Leader has the {Revolutionary Army} type, give up to 1 of your opponent's Leader or Character cards −1000 power during this turn.[When Attacking] If this Character has 7000 power or more, give up to 1 of your opponent's Leader or Character cards −1000 power during this turn.",
    "[On Play] If your Leader has the {Revolutionary Army} type, give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[On Play] K.O. up to 2 of your opponent's Characters with a total power of 4000 or less.",
    "[DON!! x1] [Activate: Main] [Once Per Turn] Give up to 2 rested DON!! cards to your Leader or 1 of your Characters.",
    "[On Play] Draw 1 card if your Leader has 0 power or less.",
    "[On Play] K.O. up to 1 of your opponent's Characters with 1000 power or less.",
    "[On Play] K.O. up to 1 of your opponent's Characters with 2000 power or less.",
    "-",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[DON!! x1] [When Attacking] Give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Revolutionary Army} type card other than [Belo Betty] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[When Attacking] If this Character has 7000 power or more, your opponent cannot activate [Blocker] during this battle.",
    "[When Attacking] If this Character has 7000 power or more, K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[DON!! x1] [When Attacking] K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "[Activate: Main] You may rest this Character: Rest up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[DON!! x1] [When Attacking] [Once Per Turn] You may rest 1 of your Characters with a cost of 3 or more: Set this Character as active.",
    "[Activate: Main] You may trash this Character: Rest up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[Activate: Main] You may trash this Character: K.O. up to 1 of your opponent's rested Characters with a cost of 2 or less.",
    "[On Your Opponent's Attack] [Once Per Turn] ➀ (You may rest the specified number of DON!! cards in your cost area.): Rest up to 1 of your opponent's Characters with a cost of 6 or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Opponent's Turn] If your rested Character would be K.O.'d, you may trash this Character instead.",
    "[When Attacking] [Once Per Turn] If you have 2 or more rested Characters, set up to 1 of your rested Characters with a cost of 1 as active.",
    "[End of Your Turn] ①: Set this Character as active.[Once Per Turn] If this Character would be K.O.'d, you may rest up to 1 of your Characters with a cost of 3 or more other than [Pica] instead.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Character: Play up to 1 {Donquixote Pirates} type Character card with a cost of 2 or less from your hand.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Character: Look at 5 cards from the top of your deck; reveal up to 1 {Donquixote Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Block] Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[On Play] Up to 1 of your opponent's Characters with a cost of 7 or less cannot attack until the start of your next turn.",
    "[On Play] If your Leader is multicolored, look at 3 cards from the top of your deck and add up to 1 card to your hand. Then, place the rest at the top or bottom of the deck in any order.",
    "[Activate: Main] You may trash 1 card from your hand and rest this Character: Place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    "[On K.O.] Draw 1 card and place 1 card from your hand at the bottom of your deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Block] Draw 1 card if you have 3 or less cards in your hand. Then, this Character gains +1000 power during this battle.",
    "[DON!! x1] [When Attacking] Place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    "[DON!! x1] [When Attacking] Return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "[On Play] Draw 1 card if you have 5 or less cards in your hand.",
    "[On Play] Place up to 1 Character with a cost of 4 or less at the bottom of the owner's deck.",
    "[Your Turn] [Once Per Turn] When you draw a card outside of your Draw Phase, this Character gains +2000 power during this turn.",
    "[On Play] Draw 2 cards and place 2 cards from your hand at the bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Look at 5 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[On Play] You may place 1 of your Characters other than this Character at the bottom of your deck: Draw 1 card.",
    "[DON!! x1] [When Attacking] If you have 8 or more DON!! cards on your field, rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "If you have 10 DON!! cards on your field, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] If you have 8 or more DON!! cards on your field, K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Kid Pirates} type card other than [Killer] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Opponent's Turn] If you have 10 DON!! cards on your field, this Character gains +1000 power.",
    "[When Attacking] If you have 3 or less Life cards, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[On Play] If you have 8 or more DON!! cards on your field, set up to 1 of your purple {Straw Hat Crew} type Characters with 6000 power or less as active.",
    "[When Attacking] If your opponent has more DON!! cards on their field than you, look at 5 cards from the top of your deck; reveal up to 1 {Heart Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[DON!! x1] If you have 8 or more DON!! cards on your field, this Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[When Attacking] If your opponent has more DON!! cards on their field than you, give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[On Play] If you have 8 or more DON!! cards on your field, give up to 2 of your opponent's Characters −2000 power during this turn.",
    "[On Play] You may trash 1 card from your hand: Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Blocker][Your Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[On Your Opponent's Attack] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 {Baroque Works} type Character card with a cost of 3 or less from your hand.",
    "[On Play] Your opponent places 3 cards from their trash at the bottom of their deck in any order.",
    "[When Attacking] [Once Per Turn] You may return 20 cards from your trash to your deck and shuffle it: This Character gains [Double Attack] and +10000 power during this battle.(This card deals 2 damage.)",
    "[Activate: Main] You may trash this Character: Give up to 1 of your opponent's Characters −3 cost during this turn.",
    "[Activate: Main] You may rest this Character and place 2 cards from your trash at the bottom of your deck in any order: If your opponent has 6 or more cards in their hand, your opponent trashes 1 card from their hand.",
    "[Your Turn] If the only Characters on your field are {Celestial Dragons} type Characters, give all of your opponent's Characters −4 cost.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Trash 1 card from the top of your deck.",
    "If you have 10 or more cards in your trash, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[DON!! x1] [When Attacking] You may K.O. 1 of your Characters other than this Character: Give up to 1 of your opponent's Characters −5 cost during this turn.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Character and place 2 cards from your trash at the bottom of your deck in any order: Add up to 1 black Character card with a cost of 3 to 5 from your trash to your hand.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Character and 1 of your Characters: Add up to 1 black Character card with a cost of 1 from your trash to your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play]/[On K.O.] Up to 1 of your {Dressrosa} type Characters gains +2000 power during this turn.",
    "[Blocker][On Play] Add up to 1 black Character card with a cost of 3 to 7 other than [Rebecca] from your trash to your hand. Then, play up to 1 black Character card with a cost of 3 or less from your hand rested.",
    "[Your Turn] If the only Characters on your field are {Celestial Dragons} type Characters, give all of your opponent's Characters −6 cost.",
    "[On Play] You may place 3 cards from your trash at the bottom of your deck in any order: K.O. up to 1 of your opponent's Characters with a cost of 2 or less and up to 1 of your opponent's Characters with a cost of 1 or less.",
    "[On Your Opponent's Attack] You may rest this Character: Your opponent may trash 1 card from the top of their Life cards. If they do not, give up to 1 of your opponent's Leader or Character cards −2000 power during this turn.",
    "[Rush][Once Per Turn] If this Character would leave the field, you may trash 1 card from the top of your Life cards instead. If there is a [Monkey.D.Luffy] Character, this effect is negated.",
    "If you have 2 or less Life cards, this Character gains +1000 power.[On Play] Look at 5 cards from the top of your deck; reveal up to 1 [Holly] and add it to your hand. Then, place the rest at the bottom of your deck in any order and play up to 1 [Holly] from your hand.",
    "[On Play] K.O. up to 1 of your opponent's Characters with a cost equal to or less than the number of your opponent's Life cards.",
    "[On Play] If you have [Hotori], K.O. up to 1 of your opponent's Characters with a cost equal to or less than the number of your opponent's Life cards.",
    "[On Play] You may place 1 of your Stages at the bottom of your deck: Draw 1 card and trash 1 card from your hand.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Sky Island} type card other than [Shura] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Your Turn] [Once Per Turn] When a card is added to your hand from your Life, this Character gains +2000 power during this turn.",
    "[Once Per Turn] When a [Trigger] activates, draw 2 cards and trash 2 cards from your hand.",
    "[On Play] You may play 1 [Kotori] from your hand: Add up to 1 of your opponent's Characters with a cost of 3 or less to the top or bottom of your opponent's Life cards face-up.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] Play up to 1 {Sky Island} type Character card with a cost of 1 from your hand.",
    "[On Play] Draw 4 cards if your opponent has 3 or less Life cards.",
    "[On Play] DON!! −10: Place all of your Characters except this Character at the bottom of your deck in any order. Then, take an extra turn after this one.[Activate: Main] [Once Per Turn] ➀: Add up to 1 DON!! card from your DON!! deck and set it as active."
  ].freeze

  TRIGGER = [
    "",
    "If your Leader is multicolored, play this card.",
    "You may trash 1 card from your hand: If your Leader is multicolored, play this card.",
    "DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "You may trash 1 card from your hand: Play this card.",
    "Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP05")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP05")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
