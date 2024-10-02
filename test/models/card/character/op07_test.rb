require 'test_helper'

class Card::Character::OP07Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] Set the power of up to 1 of your opponent's Characters to 0 during this turn.",
    "[Activate: Main] You may trash this Character: Give up to 2 of your opponent's Characters −2000 power during this turn.",
    "[On Play] You may trash 1 card from your hand: Look at 5 cards from the top of your deck; reveal up to 1 Character card with 2000 power or less and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[On Play] You may give your 1 active Leader −5000 power during this turn: Draw 1 card and trash 1 card from your hand.",
    "-",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Up to 1 of your red Characters with a cost of 1 gains [Double Attack] during this turn.(This card deals 2 damage.)",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Your Opponent's Attack] [Once Per Turn] You may trash 1 card from your hand: Up to 1 of your Leader or Character cards gains +2000 power during this battle.",
    "[DON!! x1] [When Attacking] K.O. up to 1 of your opponent's Characters with 2000 power or less.",
    "[On Play] Give up to 1 of your opponent's Characters −1000 power during this turn.",
    "[On Play] If your Leader is [Portgas.D.Ace], look at 5 cards from the top of your deck; reveal up to 1 [Portgas.D.Ace] or red Event and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Your Turn] [On Play] Up to 1 of your [Portgas.D.Ace] cards gains +2000 power during this turn.",
    "[Rush] (This card can attack on the turn in which it is played.)[On Play] Give up to 2 rested DON!! cards to your Leader or 1 of your Characters.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] If your Leader has the {Fish-Man} type, play up to 1 {Fish-Man} or {Merfolk} type Character card with a cost of 3 or less from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[End of Your Turn] Set up to 1 of your DON!! cards as active.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 green {Land of Wano} type card other than [Otama] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "If you have 6 or more rested DON!! cards, this Character gains +1000 power.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Your Opponent's Attack] You may rest this Character: Up to 1 of your {Fish-Man} type Characters with a cost of 5 or less gains [Blocker] during this turn.(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Play up to 1 [Caribou] with a cost of 4 or less from your hand rested.",
    "[On Play] Up to 1 of your opponent's rested Character or DON!! cards will not become active in your opponent's next Refresh Phase.",
    "If your Leader has the {Supernovas} type, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Once Per Turn] If this Character would be removed from the field by your opponent's effect, you may rest 1 of your opponent's Characters instead.",
    "If you have a [Camie] Character, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Your Turn] [Once Per Turn] If a Character is rested by your effect, draw 1 card and trash 1 card from your hand.",
    "This Character can attack Characters on the turn in which it is played.[On Play] If your Leader has the {Fish-Man} or {Merfolk} type, rest up to 1 of your opponent's Characters with a cost of 6 or less.",
    "If you have 3 or more Characters, your Characters with a cost of 3 or less other than [Monkey.D.Luffy] cannot be K.O.'d by your opponent's effects.",
    "[When Attacking] If you have 3 or more Characters, this Character gains +2000 power during this turn.",
    "[DON!! x1] [When Attacking] Look at 3 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[On Play] ① (You may rest the specified number of DON!! cards in your cost area.): Return up to 1 Character with a cost of 2 or less to the owner's hand.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Amazon Lily} or {Kuja Pirates} type card other than [Gloriosa (Grandma Nyon)] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Once Per Turn] If your Leader has the {The Seven Warlords of the Sea} type and this Character would be removed from the field by your opponent's effect, you may place 1 of your Characters other than [Gecko Moria] at the bottom of the owner's deck instead.",
    "[Your Turn] [On Play] Up to 1 of your [Boa Hancock] cards gains +2000 power during this turn.",
    "[On Play] Draw 1 card.",
    "[On Play] Play up to 1 {The Seven Warlords of the Sea} type Character card with a cost of 4 or less other than [Jinbe] from your hand.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {The Seven Warlords of the Sea} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] You may return this Character to the owner's hand: If your opponent has 6 or more cards in their hand, your opponent places 1 card from their hand at the bottom of their deck.",
    "[Activate: Main] [Once Per Turn] ➁ (You may rest the specified number of DON!! cards in your cost area.): Reveal 1 card from the top of your deck. If that card is a {The Seven Warlords of the Sea} type Character card with a cost of 4 or less, you may play that card rested. Then, place the rest at the bottom of your deck.",
    "[On Play] Play up to 1 [Edward Weevil] with a cost of 4 or less from your hand rested.",
    "[On Play] If you have 2 or more {Amazon Lily} or {Kuja Pirates} type Characters on your field, return up to 1 of your opponent's Characters with a cost of 3 or less to the owner's hand.",
    "[On Play] Up to 1 of your opponent's Characters other than [Monkey.D.Luffy] cannot attack until the end of your opponent's next turn. Then, place up to 1 Character with a cost of 1 or less at the bottom of the owner's deck.",
    "[On Play] If you have 2 or more {Amazon Lily} or {Kuja Pirates} type Characters on your field, place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Draw 2 cards and place 2 cards from your hand at the top or bottom of your deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Draw 1 card.",
    "[Activate: Main] [Once Per Turn] If your Leader has the {Foxy Pirates} type and you have no other [Itomimizu], add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {The Vinsmoke Family} type, draw 1 card.",
    "[On Play] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, return up to 1 of your {The Vinsmoke Family} type Characters with a cost of 1 to the owner's hand.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Foxy Pirates} type, up to 1 of your opponent's Characters with a cost of 6 or less cannot attack until the end of your opponent's next turn.",
    "If the number of DON!! cards on your field is at least 2 less than the number on your opponent's field, give this card in your hand −3 cost.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] If your Leader has the {Foxy Pirates} type and the number of DON!! cards on your field is equal to or less than the number on your opponent's field, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[DON!! x1] [When Attacking] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, add up to 1 DON!! card from your DON!! deck and rest it.",
    "If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, your {Foxy Pirates} type Characters other than [Pickles] cannot be K.O.'d by your opponent's effects.",
    "[On Play] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, play up to 1 {Foxy Pirates} type card with a cost of 4 or less from your hand.",
    "[Opponent's Turn] If your Leader has the {Foxy Pirates} type, give all of your opponent's Characters −1000 power.[Activate: Main] [Once Per Turn] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Look at 5 cards from the top of your deck; reveal up to 1 {Foxy Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order and play up to 1 purple Character card with 4000 power or less from your hand.",
    "[Activate: Main] [Once Per Turn] DON!! −3 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your opponent has 3 or more Characters, set this Character as active.",
    "[Activate: Main] You may trash this Character: If your Leader has the {Foxy Pirates} type, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] You may place 2 cards with a type including \"CP\" from your trash at the bottom of your deck in any order: Give up to 1 of your opponent's Characters −3 cost during this turn.",
    "[DON!! x1] [Your Turn] Give all of your opponent's Characters −1 cost.",
    "[On Play] Trash 2 cards from the top of your deck and give up to 1 of your opponent's Characters −1 cost during this turn.",
    "[Activate: Main] You may place 4 {Thriller Bark Pirates} type cards from your trash at the bottom of your deck in any order: This Character gains [Banish] and +1000 power during this turn.(When this card deals damage, the target card is trashed without activating its Trigger.)",
    "[On Play] You may trash 1 of your Characters: K.O. up to 1 of your opponent's Characters.",
    "[On Play] Trash 2 cards from the top of your deck and give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[Your Turn] If your opponent has a Character with a cost of 0, this Character gains +3000 power.",
    "[Your Turn] [On Play] Up to 1 of your [Rob Lucci] cards gains +2000 power during this turn.",
    "[On Play] Your opponent trashes 1 card from their hand and reveals their hand. Then, your opponent draws 1 card.",
    "[When Attacking] Trash up to 1 of your opponent's Characters with a cost of 2 or less. Then, place any number of Character cards with a cost of 4 or more from your trash at the bottom of your deck in any order. This Character gains +1000 power during this turn for every 3 cards placed at the bottom of your deck.",
    "[On Play] You may place 2 cards with a type including \"CP\" from your trash at the bottom of your deck in any order: K.O. up to 1 of your opponent's Characters with a cost of 1 or less.",
    "[On Play] You may place 3 cards from your trash at the bottom of your deck in any order: Your opponent trashes 1 card from their hand. Then, you may place up to 1 card from your opponent's trash at the bottom of their deck.",
    "If you have less Life cards than your opponent, this Character cannot be K.O.'d in battle.",
    "[On Play] If you have 2 or less Life cards, draw 2 cards and trash 2 card from your hand.",
    "[On K.O.] If you have 2 or less Life cards, play up to 1 {Egghead} type Character card with a cost of 4 or less from your trash rested.",
    "[DON!! x1] [When Attacking] If you have 1 or less Life cards, K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[Activate: Main] You may trash this Character: If you have 2 or less Life cards, K.O. up to 1 of your opponent's Characters with a cost of 4 or less. Then, draw 1 card.",
    "[On Play] You may add 1 card from the top or bottom of your Life cards to your hand: K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Egghead} type card other than [Lilith] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[When Attacking] [Once Per Turn] You may add 1 card from the top or bottom of your Life cards to your hand: You may rest up to 1 of your opponent's Characters with a cost of 4 or less. Then, if you have 1 or less Life cards, add up to 1 card from the top of your deck to the top of your Life cards.",
    "[On Play] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 5 or less and up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[On Play] Add up to 1 card from the top of your deck to the top of your Life cards. Then, if you have 2 or less Life cards, this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)"
  ].freeze

  TRIGGER = [
    "",
    "Play this card.",
    "If your Leader is [Vegapunk], play this card.",
    "Up to 1 of your {Egghead} type Leader or Character cards gains +2000 power until the end of your next turn.",
    "Return up to 1 of your opponent's Characters with a cost of 4 or less to the owner's hand and add this card to your hand.",
    "Up to 1 of your {Egghead} type Characters gains [Blocker] during this turn. Then, add this card to your hand.",
    "If your Leader has the {Egghead} type, draw 2 cards.",
    "Draw 1 card. Then, if you have 1 or less Life cards, play this card.",
    "K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "If your Leader has the {Egghead} type, rest up to 1 of your opponent's Leader or Character cards."
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
