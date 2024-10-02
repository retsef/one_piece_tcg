require 'test_helper'

class Card::Character::OP08Test < ActiveSupport::TestCase
  EFFECT = [
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] If you have [Chess], K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[On Play] Give up to 1 of your opponent's Characters −2000 power during this turn. Then, if you don't have [Kuromarimo], play up to 1 [Kuromarimo] from your hand.",
    "[Your Turn] If you have [Kuromarimo] and [Chess] in your trash, this Character gains +2000 power.",
    "[Your Turn] [On Play]/[When Attacking] Look at 5 cards from the top of your deck and play up to 1 {Animal} type Character card with 4000 power or less rested. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] Give up to 1 of your opponent's Characters −1000 power during this turn.[DON!! x1] [Activate: Main] [Once Per Turn] You may add 1 card from the top of your Life cards to your hand: This Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "-",
    "[DON!! x1] [Activate: Main] [Once Per Turn] Up to 1 of your {Animal} type Characters other than this Character gains +1000 power during this turn.",
    "[DON!! x2] [When Attacking] If your Leader has the {Drum Kingdom} type, K.O. up to 1 of your opponent's Characters with 4000 power or less.",
    "[DON!! x2] This Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[DON!! x1] [When Attacking] Give up to 1 of your opponent's Characters −2000 power during this turn. Then, this Character gains +2000 power until the end of your opponent's next turn.",
    "[On Play] Look at 4 cards from the top of your deck; reveal up to 1 [Tony Tony.Chopper] or {Drum Kingdom} type card other than [Dr.Kureha] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] You may rest this Character: If your Leader is [Tony Tony.Chopper], all of your [Tony Tony.Chopper] Characters gain +2000 power during this turn.",
    "[On Play] If your Leader has the {Minks} type, up to 2 of your opponent's rested Characters with a cost of 5 or less will not become active in your opponent's next Refresh Phase.",
    "[On Play]/[When Attacking] Up to 1 of your opponent's rested Characters with a cost of 7 or less will not become active in your opponent's next Refresh Phase.",
    "[When Attacking] Up to 1 of your opponent's rested Characters with a cost of 4 or less will not become active in your opponent's next Refresh Phase.",
    "[On Play] Up to 1 of your opponent's rested Characters with a cost of 3 or less will not become active in your opponent's next Refresh Phase.",
    "[DON!! x1] [When Attacking] Up to 1 of your opponent's rested Characters with a cost of 1 or less will not become active in your opponent's next Refresh Phase.",
    "[On Play] If your opponent has 7 or more rested cards, this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "If this Character is active, your {Minks} type Characters with a cost of 3 or less other than [Pekoms] cannot be K.O.'d by effects.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] Choose one:• Rest up to 1 of your opponent's DON!! cards.• K.O. up to 1 of your opponent's rested Characters with a cost of 6 or less.",
    "[On Play] Set up to 1 of your {Minks} type Characters with a cost of 2 or less as active.",
    "[Activate: Main] You may rest this Character: If your Leader has the {Minks} type, set up to 1 of your DON!! cards as active.",
    "[On Play] If your Leader has the {Minks} type and your opponent has 7 or more rested cards, K.O. up to 1 of your opponent's rested Characters with a cost of 2 or less.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Minks} type card other than [Wanda] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] You may reveal 2 cards with a type including \"Whitebeard Pirates\" from your hand: If your Leader's type includes \"Whitebeard Pirates\", return up to 1 of your opponent's Characters with a cost of 4 or less to the owner's hand.",
    "[Activate: Main] You may return this Character to the owner's hand: If your Leader has the {Kuja Pirates} type, place up to 1 of your opponent's Characters with a cost of 1 or less at the bottom of the owner's deck.",
    "[DON!! x1] [When Attacking] Return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "[On Play] If your Leader's type includes \"Whitebeard Pirates\" and you have 2 or less Life cards, select all of your opponent's Characters on their field. Until the end of your opponent's next turn, none of the selected Characters can attack unless your opponent trashes 2 cards from their hand whenever they attack.",
    "[Activate: Main] [Once Per Turn] You may reveal 2 cards with a type including \"Whitebeard Pirates\" from your hand: This Character gains +2000 power during this turn.",
    "If this Character would be removed from the field by your opponent's effect or K.O.'d, trash this Character and draw 1 card instead.",
    "[Your Turn] [Once Per Turn] When a Character is removed from the field by your effect, if your opponent has 5 or more cards in their hand, your opponent places 1 card from their hand at the bottom of their deck. Then, rest this Character.",
    "[On Play] You may return 1 of your Characters other than this Character to the owner's hand: Return up to 1 Character with a cost of 6 or less to the owner's hand.",
    "[On Play] Reveal 1 card from the top of your deck and place it at the top or bottom of your deck. If the revealed card's type includes \"Whitebeard Pirates\", this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Draw 2 cards and place 2 cards from your hand at the top or bottom of your deck in any order.",
    "[Your Turn] [On Play] Up to 1 of your [Edward Weevil] cards gains +2000 power during this turn.",
    "[On Play] Reveal 1 card from the top of your deck and play up to 1 Character card with a type including \"Whitebeard Pirates\" and a cost of 4 or less. Then, place the rest at the top or bottom of your deck.",
    "[Activate: Main] You may trash this Character: If your Leader has the {Animal Kingdom Pirates} type and you have 10 DON!! cards on your field, play up to 1 [King] with a cost of 7 or less from your hand.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your opponent has 5 or more DON!! cards on their field, this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    "[When Attacking] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[Activate: Main] You may trash this Character: If your Leader has the {Big Mom Pirates} type, play up to 1 [Charlotte Katakuri] from your hand with a cost of 3 or more that is equal to or less than the number of DON!! cards on your opponent's field.",
    "[On Play] You may turn 1 card from the top of your Life cards face-down: Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Activate: Main] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 [Biscuit Warrior] from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Your Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On K.O.] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] DON!! −1, You may trash 1 card from your hand: Add up to 1 card from the top of your deck to the top of your Life cards. Then, add up to 1 of your opponent's Characters with a cost of 6 or less to the top or bottom of your opponent's Life cards face-up.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 [Viscount Hiyoko] with a cost of 5 or less from your hand.",
    "[Opponent's Turn] [On K.O.] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 [Baron Tamago] with a cost of 4 or less from your deck. Then, shuffle your deck.",
    "Under the rules of this game, you may have any number of this card in your deck.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[Opponent's Turn] [On K.O.] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 [Count Niwatori] with a cost of 6 or less from your deck. Then, shuffle your deck.",
    "[Activate: Main] [Once Per Turn] If you have no other [Black Maria] Characters, add up to 5 DON!! cards from your DON!! deck and rest them. Then, at the end of this turn, return DON!! cards from your field to your DON!! deck until you have the same number of DON!! cards on your field as your opponent.",
    "[Activate: Main] [Once Per Turn] You may trash 1 card from your hand: If this Character was played on this turn, trash up to 1 of your opponent's Characters with a cost of 7 or less. Then, your opponent trashes 1 card from their hand.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Animal Kingdom Pirates} type card other than [Queen] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[When Attacking] You may place 3 cards with a type including \"CP\" from your trash at the bottom of your deck in any order: K.O. up to 1 of your opponent's Characters with a cost of 0.",
    "[Activate: Main] Rest 1 of your DON!! cards and you may rest this Character: Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[DON!! x1] [Your Turn] Give all of your opponent's Characters −1 cost.",
    "This Character gains +4 cost.[Activate: Main] You may rest this Character: Draw 1 card and trash 1 card from your hand. Then, K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[DON!! x1] [When Attacking] If you have a Character with a cost of 8 or more, K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[On Play] If your opponent has a Character with a cost of 0, draw 2 cards and trash 2 cards from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Activate: Main] [Once Per Turn] Give up to 1 of your opponent's Characters −1 cost during this turn.",
    "[On Play] Up to 1 of your Characters gains +1 cost until the end of your opponent's next turn.",
    "[On Play] Play up to 1 {SMILE} type Character card with a cost of 2 or less from your trash.",
    "[On Play] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[On Play] Play up to 1 [Ulti] with a cost of 4 or less from your trash.",
    "[DON!! x1] This Character gains +2 cost.",
    "[On Play] Look at 7 cards from the top of your deck and play up to 1 [Upper Yard]. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] [Once Per Turn] You may trash 1 card from the top of your Life cards: If your Leader has the {Big Mom Pirates} type, add 1 card from the top of your deck to the top of your Life cards at the end of this turn.",
    "[On Play] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost equal to or less than your number of Life cards.",
    "[Activate: Main] [Once Per Turn] You may add 1 card from the top of your Life cards to your hand: Up to 1 of your Characters gains +1000 power until the end of your opponent's next turn.",
    "[DON!! x1] [Your Turn] [Once Per Turn] When a card is removed from your opponent's Life cards, draw 2 cards and trash 1 card from your hand.",
    "[On Play] You may trash 1 card with a [Trigger] from your hand: K.O. up to 1 of your opponent's Characters with a cost of 5 or less. Then, if you have 3 or less cards in your hand, draw 1 card.",
    "[Activate: Main] You may rest this Character: Up to 1 of your [Charlotte Pudding] cards gains +2000 power during this turn.",
    "[On Play] If your Leader has the {Shandian Warrior} type and you have a [Kalgara] Character, add up to 1 card from the top of your deck to the top of your Life cards.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 [Upper Yard] and add it to your hand. Then, place the rest at the bottom of your deck in any order and play up to 1 [Upper Yard] from your hand.",
    "[DON!! x1] [When Attacking] Your opponent cannot activate [Blocker] during this battle.",
    "[On Play] Up to 1 of your opponent's Characters with a cost of 6 or less other than [Monkey.D.Luffy] cannot attack until the end of your opponent's next turn.",
    "[DON!! x1] If you have less Life cards than your opponent, this Character cannot be K.O.'d in battle by <Slash> attribute cards and gains +2000 power.",
    "[On Play] Select up to 2 of your opponent's Characters, and give 1 Character −3000 power and the other −2000 power until the end of your opponent's next turn. Then, K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[When Attacking] DON!! −10: K.O. all Characters other than this Character. Then, add up to 1 card from the top of your deck to the top of your Life cards and trash up to 1 card from the top of your opponent's Life cards."
  ].freeze

  TRIGGER = [
    "",
    "DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "You may trash 1 card from your hand: Play this card. Then, draw 1 card.",
    "Draw 2 cards and trash 1 card from your hand.",
    "Activate this card's [On Play] effect.",
    "You may trash 1 card from your hand: If you have 2 or less Life cards, play this card.",
    "You may trash 1 card from your hand: If you have 2 or less Life cards, play this card and K.O. up to 1 of your opponent's Characters with a cost of 3 or less."
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
