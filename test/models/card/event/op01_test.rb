require 'test_helper'

class Card::Event::OP01Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, K.O. up to 1 of your opponent's Characters with 4000 power or less.",
    "[Main] Give up to 1 of your opponent's Characters −10000 power during this turn.",
    "[Counter] Give up to 1 of your opponent's Leader or Character cards −2000 power during this turn.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if you have 2 or less Life cards, that card gains an additional +2000 power.",
    "[Main] Look at 5 cards from the top of your deck; reveal up to 1 {Straw Hat Crew} type Character card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main] You may rest 2 of your Characters: Draw 2 cards.",
    "[Main] K.O. up to 2 of your opponent's rested Characters with a cost of 5 or less.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, set up to 1 of your Characters as active.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Main] You may trash 1 {Land of Wano} type card from your hand: Set up to 1 of your {Land of Wano} type Character cards with a cost of 3 or less as active.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, return up to 1 active Character with a cost of 3 or less to the owner's hand.",
    "[Counter] Play up to 1 {Baroque Works} type Character card with a cost of 3 or less from your hand.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, look at 3 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[Counter] If your Leader has the {The Seven Warlords of the Sea} type, return up to 1 Character with a cost of 5 or less to the owner's hand.",
    "[Main] Look at 5 cards from the top of your deck; reveal up to 1 {Baroque Works} type card other than [Baroque Works] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main] K.O. up to 1 of your opponent's Characters with a cost of 2 or less, then add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Main] Look at 5 cards from the top of your deck; play up to 1 {SMILE} type Character card with a cost of 3 or less. Then, place the rest at the bottom of your deck in any order.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 1 of your opponent's Characters with a cost of 6 or less.",
    "[Counter] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, draw 1 card.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, if you have 2 or less Life cards, add up to 1 DON!! card from your DON!! deck and rest it."
  ].freeze

  TRIGGER = [
    "Give up to 1 of your opponent's Leader or Character cards −10000 power during this turn.",
    "",
    "Activate this card's [Counter] effect.",
    "Up to 1 of your Leader or Character cards gains +1000 power during this turn.",
    "Activate this card's [Main] effect.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    "Rest up to 1 of your opponent's Characters.",
    "Return up to 1 Character with a cost of 4 or less to the owner's hand.",
    "Draw 2 cards and trash 1 card from your hand.",
    "Add up to 1 DON!! card from your DON!! deck and set it as active."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
