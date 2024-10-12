require 'test_helper'

class Card::Event::OP05Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +3000 power during this battle. Then, play up to 1 {Revolutionary Army} type Character card with 5000 power or less from your hand.",
    "[Main] Give up to 1 of your opponent's Characters −4000 power during this turn. Then, if you have 2 or less Life cards, K.O. up to 1 of your opponent's Characters with 0 power or less.",
    "[Main] Up to 1 of your Leader or Character cards gains +2000 power during this turn. Then, K.O. up to 1 of your opponent's Characters with 2000 power or less.",
    "[Counter] You may trash 1 card from your hand: Up to 1 of your Leader or Character cards gains +3000 power during this battle.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, you may trash 1 card from your hand. If you do, set up to 3 of your DON!! cards as active.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "[Main] Up to 1 of your Leader or Character cards gains +3000 power during this turn. Then, place up to 1 Character with a cost of 2 or less at the bottom of the owner's deck.",
    "[Main] Place all Characters with a cost of 3 or less at the bottom of the owner's deck. Then, you and your opponent trash cards from your hands until you each have 5 cards in your hands.",
    "[Main] If your Leader is multicolored, draw 1 card. Then, return up to 1 Character with a cost of 5 or less to the owner's hand.",
    "[Main] Look at 3 cards from the top of your deck; reveal up to 1 {Straw Hat Crew}, {Kid Pirates}, or {Heart Pirates} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Give up to 1 of your opponent's Characters −5000 power during this turn.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Up to 1 of your {Kid Pirates} type Leader or Character cards gains +5000 power during this turn.",
    "[Main] Give up to 1 of your opponent's Characters −3 cost during this turn. Then, up to 1 of your opponent's Characters with a cost of 0 will not become active in the next Refresh Phase.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, if you have 15 or more cards in your trash, K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Main] Choose one:• K.O. up to 1 of your opponent's Characters with a cost of 1 or less.• Return up to 1 of your opponent's Characters with a cost of 1 or less to the owner's hand.• Place up to 1 of your opponent's Characters with a cost of 1 or less at the top or bottom of their Life cards face-up.Then, if you have a {Celestial Dragons} type Character, draw 1 card.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if your opponent has 2 or less Life cards, that card gains an additional +2000 power during this battle.",
    "[Main] Up to 1 of your Leader or Character cards gains +3000 power during this turn. Then, if you have 1 or less Life cards, rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Main] K.O. up to 1 of your opponent's Characters with a cost equal to or less than the number of your opponent's Life cards."
  ].freeze

  TRIGGER = [
    "Play up to 1 {Revolutionary Army} type Character card with 5000 power or less from your hand.",
    "Activate this card's [Main] effect.",
    "Up to 1 of your Leader or Character cards gains +1000 power during this turn.",
    "Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "Rest up to 1 of your opponent's Leader or Character cards with a cost of 3 or less.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 5 or less.",
    "Return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "Place all Characters with a cost of 2 or less at the bottom of the owner's deck.",
    "If your Leader is multicolored, draw 2 cards.",
    "Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "Draw 2 cards and trash 1 card from your hand.",
    "",
    "K.O. up to 1 of your opponent's Characters with a cost of 6 or less, or return it to the owner's hand.",
    "K.O. up to 1 of your opponent's Characters with a cost equal to or less than the number of your opponent's Life cards.",
    "You may trash 2 cards from your hand: Add up to 1 card from the top of your deck to the top of your Life cards."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP05")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP05")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
