require 'test_helper'

class Card::Event::OP04Test < ActiveSupport::TestCase
  EFFECT = [
    '[Counter] You may trash 1 card from your hand: Up to 1 of your Leader or Character cards gains +3000 power during this battle.',
    "[Counter] Give up to 1 of your opponent's Leader or Character cards −2000 power during this turn. Then, if your Leader is active, give up to 1 of your opponent's Leader or Character cards −1000 power during this turn.",
    "[Main] If your Leader has the {Alabasta} type, give up to 2 of your opponent's Characters −2000 power during this turn.",
    '[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, set up to 1 of your Characters as active.',
    '[Counter] Look at 5 cards from the top of your deck; reveal up to 1 {Donquixote Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    '[Counter] If your Leader has the {Donquixote Pirates} type, up to 1 of your Leader or Character cards gains +2000 power during this turn.',
    "[Main]/[Counter] Rest up to 1 of your opponent's Leader or Character cards. Then, K.O. up to 1 of your opponent's rested Characters with a cost of 6 or less.",
    "[Main] You may trash 1 [Ice Oni] from your hand and place 1 Character with a cost of 4 or less at the bottom of the owner's deck: Play 1 [Ice Oni] from your trash.",
    "[Main] Place up to 1 Character at the bottom of the owner's deck.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, place up to 1 Character with a cost of 1 or less at the bottom of the owner's deck.",
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Up to 1 of your Leader or Character cards gains +1000 power during this battle. Then, rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    '[Counter] Up to 1 of your Leader or Character cards gains +6000 power during this battle. Then, if you have 2 or less Life cards, add up to 1 DON!! card from your DON!! deck and rest it.',
    '[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    '[Main] Up to 1 of your {Dressrosa} type Characters gains +6000 power during this turn. Then, if you have 15 or more cards in your trash, that card gains [Double Attack] during this turn.(This card deals 2 damage.)',
    "[Main] Choose up to 1 of your opponent's Characters with a cost of 4 or less and K.O. it. If you have 15 or more cards in your trash, choose up to 1 of your opponent's Characters with a cost of 6 or less instead of a Character with a cost of 4 or less.",
    '[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if you have 15 or more cards in your trash, that card gains an additional +2000 power during this battle.',
    '[Main] You may add 1 card from the top or bottom of your Life cards to your hand: Up to 1 of your {Land of Wano} type Characters gains [Double Attack] during this turn.(This card deals 2 damage.)',
    "[Counter] Up to 1 of your Leader or Character cards gains +6000 power during this battle. Then, if you and your opponent have a total of 4 or less Life cards, K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Main] Add up to 1 of your opponent's Characters with a cost of 3 or less to the top or bottom of your opponent's Life cards face-up."
  ].freeze

  TRIGGER = [
    "Give up to 1 of your opponent's Leader or Character cards −3000 power during this turn.",
    '',
    "Activate this card's [Main] effect.",
    'Up to 1 of your Leader gains +2000 power during this turn.',
    "Activate this card's [Counter] effect.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    'Set up to 5 of your DON!! cards as active.',
    "Place up to 1 Character with a cost of 4 or less at the bottom of the owner's deck.",
    "Return up to 1 Character with a cost of 6 or less to the owner's hand.",
    'Add up to 1 DON!! card from your DON!! deck and set it as active.',
    'Draw 3 cards and trash 2 cards from your hand.',
    "You may rest your Leader: K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    'Draw 2 cards and trash 1 card from your hand.',
    'Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    'Draw 1 card.',
    'You may add 1 card from the top or bottom of your Life cards to your hand: Add up to 1 card from your hand to the top of your Life cards.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP04')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP04')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
