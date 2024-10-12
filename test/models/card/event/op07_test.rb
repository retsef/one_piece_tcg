require 'test_helper'

class Card::Event::OP07Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] Up to 1 of your {Revolutionary Army} type Characters gains +2000 power during this turn. Then, give up to 1 of your opponent's Characters −1000 power during this turn.",
    "[Main] K.O. up to 1 of your opponent's Characters with 3000 power or less and up to 1 of your opponent's Stages with a cost of 1 or less.",
    '[Counter] Up to 1 of your {Revolutionary Army} type Characters gains +2000 power until the end of your next turn.',
    '[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if you have 3 or more Characters, that card gains an additional +1000 power during this battle.',
    "[Main] Up to 1 of your Leader or Character cards gains +3000 power during this turn. Then, you may rest 1 of your Characters with a cost of 3 or more. If you do, rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    '[Main] Look at 5 cards from the top of your deck; reveal up to 1 {Supernovas} type card other than [More Pizza!!] and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, return up to 1 of your Characters to the owner's hand.",
    "[Counter] You may return 1 of your Characters with a cost of 2 or more to the owner's hand: Up to 1 of your Leader or Character cards gains +4000 power during this battle.",
    '[Main] Select up to 1 of your {The Seven Warlords of the Sea} type Leader or Character cards and that card gains +2000 power during this turn. Then, if the selected card attacks during this turn, your opponent cannot activate [Blocker].',
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Give up to 1 each of your opponent's Leader and Character cards −2000 power during this turn.",
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, rest up to 1 of your opponent's Characters.",
    '[Main] If your Leader has the {Animal Kingdom Pirates} or {Big Mom Pirates} type, look at 5 cards from the top of your deck; reveal up to 1 {Animal Kingdom Pirates} or {Big Mom Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    "[Main] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field, set up to 1 of your [Foxy] cards as active.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if you have 10 or more cards in your trash, return up to 1 of your Characters with a type including \"CP\" to the owner's hand.",
    '[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, if you have 10 or more cards in your trash, that card gains an additional +2000 power during this battle.',
    "[Main] Draw 1 card. Then, if you have 10 or more cards in your trash, give up to 1 of your opponent's Characters −3 cost during this turn.",
    "[Main] Look at 5 cards from the top of your deck; reveal up to 1 {Egghead} type card other than [He Possesses the World's Most Brilliant Mind] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    '[Counter] If you have 2 or less Life cards, up to 1 of your Leader or Character cards gains +3000 power during this battle.',
    "[Main]/[Counter] Up to 1 of your Leader or Character cards gains +1000 power during this turn. Then, if your opponent has 2 or less Life cards, rest up to 1 of your opponent's Characters with a cost of 4 or less."
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    "Activate this card's [Counter] effect.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    "Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    'Draw 1 card.',
    "You may return 1 of your Characters to the owner's hand: Return up to 1 of your opponent's Characters with a cost of 5 or less to the owner's hand.",
    'Draw 2 cards and place 2 cards from your hand at the bottom of your deck in any order.',
    '',
    'Add up to 1 DON!! card from your DON!! deck and set it as active.',
    "Return up to 1 of your Characters to the owner's hand.",
    'Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    "K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    'Play up to 1 of your {Egghead} type Character cards with a cost of 5 or less from your trash.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP07')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP07')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
