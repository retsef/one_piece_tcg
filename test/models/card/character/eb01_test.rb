require 'test_helper'

class Card::Character::EB01Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.[On Your Opponent's Attack] [Once Per Turn] You may trash 1 card from your hand: If your Leader has the {Land of Wano} or {Whitebeard Pirates} type, give up to 1 of your opponent's Leader or Character cards −2000 power during this turn.",
    '[Rush] (This card can attack on the turn in which it is played.)[When Attacking] If your opponent has 2 or less Life cards, this Character gains +2000 power during this turn.',
    "[When Attacking] You may give your 1 active Leader −5000 power during this turn: Give up to 1 of your opponent's Characters −3000 power during this turn.",
    '-',
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x2] [When Attacking] Give up to 1 of your opponent's Characters −3000 power during this turn.",
    '[Activate: Main] [Once Per Turn] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.',
    "[Once Per Turn] If this Character would be K.O.'d by an effect, you may trash 1 Event or Stage card from your hand instead.",
    '[On Play]/[When Attacking] If your Leader has the {Supernovas} type and you have no other [Cavendish] Characters, set up to 2 of your DON!! cards as active.',
    '[Activate: Main] You may trash this Character: Play up to 1 {Land of Wano} type Character card with a cost of 5 or less other than [Kouzuki Hiyori] from your hand. Then, draw 1 card.',
    '[DON!! x1] [Your Turn] This Character gains +1000 power for every 3 of your rested DON!! cards.',
    "[On Play] Rest up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Activate: Main] You may rest this Character: K.O. up to 1 of your opponent's rested Characters with a cost of 1 or less.",
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)',
    '[End of Your Turn] If you have 2 or less cards in your hand, draw 2 cards.',
    '[On Play] Draw 1 card.',
    'If you have 4 or less cards in your hand, all of your {SMILE} type Characters gain +1000 power.',
    "[DON!! x1] [When Attacking] If you have 1 or less cards in your hand, return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "If your Leader's type includes \"Baroque Works\", this Character gains +1000 power for every 2 Events in your trash.[On Play] Draw 2 cards and trash 1 card from your hand.",
    '[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Water Seven} type, add up to 2 Character cards with a cost of 4 or less from your trash to your hand.',
    '[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Water Seven} type, play up to 1 {Water Seven} type Character card with a cost of 5 other than [Blueno] from your hand or trash.',
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Your Opponent's Attack] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader's type includes \"Baroque Works\", add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[On Play] If your Leader's type includes \"Baroque Works\", up to 1 of your Leader or Character cards gains +1000 power during this turn.",
    '[Rush] (This card can attack on the turn in which it is played.)[On K.O.] If your Leader has the {Impel Down} type, add up to 1 DON!! card from your DON!! deck and rest it.',
    "[On Your Opponent's Attack] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Activate: Main] You may trash this Character: Play up to 1 {Dressrosa} type Character card with a cost of 3 or less other than [Scarlet] from your hand rested. Then, give up to 1 of your opponent's Characters −2 cost during this turn.",
    '[On Play] You may place 3 cards with a type including "CP" from your trash at the bottom of your deck in any order: Play up to 1 Character card with a type including "CP" and a cost of 4 or less other than [Spandine] from your trash rested.',
    '[Activate: Main] You may rest this Character: Up to 1 of your [Spandam] Characters gains +3000 power during this turn.',
    '[On Play] If your opponent has a Character with a cost of 0, this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)',
    "[On Play]/[When Attacking] Give up to 1 of your opponent's Characters −1 cost during this turn. Then, K.O. up to 1 of your opponent's Characters with a cost of 0.",
    "[Once Per Turn] When a Character is K.O.'d, draw 1 card and trash 1 card from your hand.",
    "[Activate: Main] You may rest this Character: Give up to 1 of your opponent's Characters −4 cost during this turn.",
    "[On Play] K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Choose one:• Look at all of your opponent's Life cards and place them back in their Life area in any order.• Turn all of your Life cards face-down.",
    "[On Play] Place up to 1 of your opponent's Characters with a cost of 3 or less at the top or bottom of your opponent's Life cards face-up.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If your opponent has 1 or less Life cards, K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    '[On Play] You may add 1 card from the top or bottom of your Life cards to your hand: Draw 1 card.',
    "When this Character is K.O.'d by your opponent's effect, add up to 1 card from the top of your deck to the top of your Life cards.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    '[DON!! x1] [Your Turn] If you have 2 or less Life cards, this Character gains +2000 power.',
    "[On Play] Add up to 1 DON!! card from your DON!! deck and set it as active.[When Attacking] Select up to 1 of your opponent's Characters. This Character's base power becomes the same as the selected Character's power during this turn."
  ].freeze

  TRIGGER = [
    '',
    'DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.',
    "Give up to a total of 2 of your opponent's Leader or Character cards −3000 power during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('EB01')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('EB01')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
