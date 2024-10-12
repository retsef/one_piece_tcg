require 'test_helper'

class Card::Character::OP06Test < ActiveSupport::TestCase
  EFFECT = [
    'If this Character has 7000 power or more, this Character gains [Banish].(When this card deals damage, the target card is trashed without activating its Trigger.)',
    '[On Play] Look at 3 cards from the top of your deck and play up to 1 {Revolutionary Army} type Character card with 5000 power or less. Then, place the rest at the bottom of your deck in any order.',
    '[On Play] Play up to 1 [Lily Carnation] from your hand.',
    '-',
    '[DON!! x1] [When Attacking] This Character gains +1000 power until the start of your next turn. Then, trash 1 of your {FILM} type Characters at the end of this turn.',
    "[On Play] K.O. up to 1 of your opponent's Characters with 10000 power or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[When Attacking]/[On Block] [Once Per Turn] This Character's base power becomes the same as your opponent's Leader until the start of your next turn.",
    'If your Leader has the {FILM} type, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)',
    '[Activate: Main] [Once Per Turn] You may rest 1 of your [Uta] cards: This Character gains +5000 power during this turn.',
    "If your opponent has a Leader or Character with a base power of 6000 or more, this Character cannot be K.O.'d in battle.",
    '[On Play] Look at 3 cards from the top of your deck; reveal up to 1 {FILM} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    "[On Your Opponent's Attack] You may trash any number of {FILM} type cards from your hand. Your Leader or 1 of your Characters gains +1000 power during this battle for every card trashed.",
    '[Activate: Main] [Once Per Turn] You may trash 1 of your Characters with 6000 power or more: Play up to 1 {FILM} type Character card with 2000 to 5000 power from your trash rested.',
    "[Activate: Main] You may place this Character at the bottom of the owner's deck: Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[On Play] You may trash 1 card from your hand: Up to 1 of your opponent's rested Leader cannot attack until the end of your opponent's next turn.",
    '[On Play] If your Leader has the {New Fish-Man Pirates} type, play up to 1 {Fish-Man} type Character card with a cost of 4 or less from your hand. Then, add 1 card from the top of your Life cards to your hand.',
    '[On Play] Look at 4 cards from the top of your deck; reveal up to 1 {Fish-Man} or {Merfolk} type card other than [Camie] and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    '[On Play] Set up to 1 of your  attribute Characters with a cost of 4 or less as active. Then, you cannot attack a Leader during this turn.',
    "[On K.O.] Rest up to 1 of your opponent's Characters with a cost of 3 or less.",
    '[DON!! x1] [When Attacking] If your Leader has the {New Fish-Man Pirates} type, set up to 1 of your DON!! cards as active and this Character gains +1000 power during this turn. Then, add 1 card from the top of your Life cards to your hand.',
    '[DON!! x1] [When Attacking] [Once Per Turn] If your Leader has the {New Fish-Man Pirates} type, set this Character as active and this Character gains +1000 power during this turn. Then, add 1 card from the top of your Life cards to your hand.',
    "[When Attacking] If your Leader has the {New Fish-Man Pirates} type, this Character cannot be K.O.'d in battle and gains +2000 power until the start of your next turn. Then, add 1 card from the top of your Life cards to your hand.",
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)',
    "[On Play] You may trash 1 {Fish-Man} type card from your hand or 1 [The Ark Noah] from your hand or field: K.O. up to 1 of your opponent's rested Characters.",
    "[Activate: Main] [Once Per Turn] Rest up to 1 of your opponent's Characters with a cost of 4 or less and this Character gains +1000 power during this turn. Then, add 1 card from the top of your Life cards to your hand.",
    "[Rush] (This card can attack on the turn in which it is played.)[On Play] Rest up to a total of 2 of your opponent's Characters or DON!! cards. Then, add 1 card from the top of your Life cards to your hand.",
    "[On Play]/[On K.O.] K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Activate: Main] [Once Per Turn] You may trash 1 card from your hand and place 1 Character with a cost of 2 or less at the bottom of the owner's deck: This Character gains +3000 power during this turn.",
    '[Your Turn] [Once Per Turn] When your opponent activates an Event, your opponent must place 1 card from their hand at the bottom of their deck.',
    '[On Play] Draw 2 cards and place 2 cards from your hand at the bottom of your deck in any order.',
    "[On Play] Place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    '[On Play] Your opponent returns all cards in their hand to their deck and shuffles their deck. Then, your opponent draws 5 cards.',
    '[Your Turn] When your opponent activates [Blocker] or an Event, if your Leader has the {East Blue} type, you may trash 4 cards from the top of your deck.',
    '[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Navy} type card other than [Tashigi] and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    "[On Play] You may trash 2 cards from your hand: Your opponent returns 1 of their Characters to the owner's hand.",
    "[DON!! x1] If you have 4 or less cards in your hand, this Character cannot be K.O.'d in battle.",
    "[On K.O.] Place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    'If you have 5 or less cards in your hand, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)',
    '[DON!! x2] [When Attacking] If you have 4 or less cards in your hand, your opponent cannot activate [Blocker] during this battle.',
    '[Activate: Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may trash this Character: If your Leader has the {GERMA 66} type, play up to 1 [Vinsmoke Ichiji] with a cost of 7 from your hand or trash.',
    "[On Play] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, give up to 1 of your opponent's Characters −2000 power during this turn and this Character gains [Rush].(This card can attack on the turn in which it is played.)",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may trash 2 cards from your hand: Play up to 4 {GERMA 66} type Character cards with different card names and 4000 power or less from your trash.[Activate: Main] [Once Per Turn] DON!! −1: Rest up to 1 of your opponent's DON!! cards.",
    "[On Play] You may trash 1 card from your hand: If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, add up to 1 {The Vinsmoke Family} type Character card with 4000 power or less from your trash to your hand.",
    '[Activate: Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may trash this Character: If your Leader has the {GERMA 66} type, play up to 1 [Vinsmoke Niji] with a cost of 5 from your hand or trash.',
    "[On Play] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, choose one:• K.O. up to 1 of your opponent's Characters with a cost of 2 or less.• Return up to 1 of your opponent's Characters with a cost of 4 or less to the owner's hand.",
    '[Activate: Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may trash this Character: If your Leader has the {GERMA 66} type, play up to 1 [Vinsmoke Yonji] with a cost of 4 from your hand or trash.',
    "If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, this Character gains +1000 power.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    '[Activate: Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may trash this Character: If your Leader has the {GERMA 66} type, play up to 1 [Vinsmoke Reiju] with a cost of 4 from your hand or trash.',
    "[On Play] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field and you have 5 or less cards in your hand, draw 2 cards.",
    '[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {FILM} type, add up to 2 {FILM} type Character cards with a cost of 4 or less from your trash to your hand.',
    "If your Leader has the {GERMA 66} type and the number of DON!! cards on your field is at least 2 less than the number on your opponent's field, this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If you have 8 or more DON!! cards on your field, draw 1 card and trash 1 card from your hand.',
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Negate the effect of up to 1 of your opponent's Characters during this turn. Then, if that Character has 5000 power or less, K.O. it.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 2 of your opponent's Characters with a cost of 2 or less.",
    "[Your Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck, K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    '[On Play] You may return 2 cards from your trash to the bottom of your deck in any order: K.O. up to 1 Character with a cost of 2 or less.',
    '[On Play]/[On K.O.] If your Leader has the {Thriller Bark Pirates} type, draw 2 cards and trash 2 cards from your hand.',
    "This Character cannot attack.[Activate: Main] You may K.O. 1 of your {Thriller Bark Pirates} type Characters: This Character's effect is negated during this turn.",
    '[On K.O.] Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    '[DON!! x2] [Your Turn] This Character gains +1000 power for every 5 cards in your trash.',
    '[On Play] Choose up to 1 Character card with a cost of 4 or less and up to 1 Character card with a cost of 2 or less from your trash. Play 1 card and play the other card rested.',
    'If your Leader has the {Dressrosa} type and is active, this Character gains +2000 power.',
    '[On Play]/[On K.O.] Trash 3 cards from the top of your deck.',
    '[On Play] You may return 2 cards from your trash to the bottom of your deck in any order: Add up to 1 {Thriller Bark Pirates} type card other than [Dr. Hogback] from your trash to your hand.',
    '[On Play] If your Leader has the {Thriller Bark Pirates} type, trash 5 cards from the top of your deck.',
    "[On Play] Choose one:• Trash up to 1 of your opponent's Characters with a cost of 4 or less.• Your opponent places 3 cards from their trash at the bottom of their deck in any order.",
    "[On Play] If your opponent has 5 or more cards in their hand, choose one:• Your opponent trashes 1 card from their hand.• Give up to 1 of your opponent's Characters −3 cost during this turn.",
    "[On Play] Look at up to 1 card from the top of your or your opponent's Life cards and place it at the top or bottom of the Life cards.",
    "[DON!! x2] [When Attacking] You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost equal to or less than the number of your opponent's Life cards.",
    '[On Play] Up to 1 of your Leader or Character cards gains [Banish] during this turn.(When this card deals damage, the target card is trashed without activating its Trigger.)',
    "[Activate: Main] [Once Per Turn] You may place 1 Stage with a cost of 1 at the bottom of the owner's deck: K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[When Attacking] You may trash 2 cards from your hand: Add up to 1 of your Characters with 0 power to the top or bottom of the owner's Life cards face-up.",
    '[On K.O.] If your opponent has 3 or less Life cards, add up to 1 card from the top of your deck to the top of your Life cards.',
    '[On Play] You may add 1 card from the top or bottom of your Life cards to your hand: Add up to 1 card from your hand to the top of your Life cards.',
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Add up to 1 of your {Land of Wano} type Characters other than [Kouzuki Momonosuke] to the top or bottom of the owner's Life cards face-up.",
    "[DON!! x2] If your opponent has 3 or less Life cards, this Character cannot be K.O.'d by effects.",
    "[DON!! x2] This Character can also attack your opponent's active Characters.",
    "[Activate: Main] [Once Per Turn] You may place 1 Stage with a cost of 1 at the bottom of the owner's deck: Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[When Attacking] You may trash 1 card from your hand: Rest up to 1 of your opponent's DON!! cards.",
    'If you have a {Shandian Warrior} type Character other than [Raki], this Character gains [Blocker].(After your opponent declares an attack, you may rest this card to make it the new target of the attack.)',
    "[On Play] You may place 1 Stage with a cost of 1 at the bottom of the owner's deck: Look at 5 cards from the top of your deck; reveal up to 1 [Upper Yard] or {Shandian Warrior} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    '[When Attacking] [Once Per Turn] ➀ (You may rest the specified number of DON!! cards in your cost area.): Set this Character as active.[Activate: Main] [Once Per Turn] ➁ (You may rest the specified number of DON!! cards in your cost area.): Set this Character as active.',
    '[On Play] Reveal 1 card from the top of your deck and play up to 1 Character with a cost of 9 or less other than [Sanji]. Then, place the rest at the bottom of your deck.'
  ].freeze

  TRIGGER = [
    '',
    "Activate this card's [On Play] effect.",
    "Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    'Play up to 1 {Fish-Man} or {Merfolk} type Character card with a cost of 3 or less from your hand.',
    'If your opponent has 3 or less Life cards, play this card.',
    "K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    'If you have 2 or less Life cards, play this card.',
    'Up to 1 of your {Land of Wano} type Leader or Character cards gains +2000 power during this turn.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP06')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP06')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
