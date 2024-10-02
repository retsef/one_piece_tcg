require 'test_helper'

class Card::Event::OP03Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] If your Leader is [Portgas.D.Ace], K.O. up to 1 of your opponent's Characters with 8000 power or less, and your Leader gains [Double Attack] and +3000 power during this turn.(This card deals 2 damage.)",
    "[Main]/[Counter] If your Leader's type includes \"Whitebeard Pirates\", give up to 1 of your opponent's Characters −4000 power during this turn.",
    "[Main] You may trash 1 Event from your hand: K.O. up to 1 of your opponent's Characters with 5000 power or less and up to 1 of your opponent's Characters with 4000 power or less.",
    "[Main] Your Leader gains +4000 power during this turn.",
    "[Main] You may rest 1 of your {East Blue} type Characters: Set up to 1 of your [Kuro] cards as active.",
    "[Main] You may rest 1 of your {East Blue} type Characters: K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "[Main] Rest up to 2 of your opponent's Characters with a cost of 2 or less.",
    "[Main] Rest up to 1 of your opponent's Characters with a cost of 1 or less. Then, up to 1 of your Characters gains +1000 power during this turn.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, you may trash 1 card from the top of your deck.",
    "[Counter] You may trash 1 card from your hand: Up to 1 of your Leader gains +4000 power during this battle. Then, you may trash 2 cards from the top of your deck.",
    "[Main] Draw 2 cards.",
    "[Main] Place up to 1 Character with a cost of 5 or less at the bottom of the owner's deck.",
    "[Counter] You may trash 1 card from your hand: Up to 1 of your Leader or Character cards gains +3000 power during this battle.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Water Seven} type, K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Main] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Place up to 1 of your opponent's Characters with a cost of 4 or less at the bottom of the owner's deck.",
    "[Main] If your Leader's type includes \"CP\", look at 5 cards from the top of your deck; play up to 1 Character card with a type including \"CP\" and a cost of 5 or less. Then, trash the rest.",
    "[Main] Give up to 2 of your opponent's Characters −2 cost during this turn.",
    "[Main] K.O. up to 1 of your opponent's Characters with a cost of 0 or your opponent's Stages with a cost of 3 or less.",
    "[Counter] Up to 1 of your Leader or Character cards gains +5000 power during this battle.",
    "[Main] If you have less Life cards than your opponent, K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Main] If your opponent has 4 or more Life cards, trash up to 1 card from the top of your opponent's Life cards.",
    "[Main] You may trash 1 card from the top of your Life cards: K.O. up to 1 of your opponent's Characters with a cost of 5 or less."
  ].freeze

  TRIGGER = [
    "K.O. up to 1 of your opponent's Characters with 6000 power or less.",
    "Activate this card's [Main] effect.",
    "K.O. up to 1 of your opponent's Characters with 5000 power or less.",
    "Give up to 1 of your opponent's Leader or Character cards −10000 power during this turn.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "Play up to 1 Character card with a cost of 4 or less and a [Trigger] from your hand.",
    "Rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    "Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "Draw 1 card and you may trash 1 card from the top of your deck.",
    "Return up to 1 Character with a cost of 4 or less to the owner's hand.",
    "Place up to 1 Character with a cost of 3 or less at the bottom of the owner's deck.",
    "Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "Play up to 1 black Character card with a cost of 3 or less from your trash.",
    "Your opponent trashes 1 card from their hand.",
    "Draw 2 cards.",
    "Draw 1 card. Then, K.O. up to 1 of your opponent's Characters with a cost of 1 or less.",
    "You may trash 2 cards from your hand: Add up to 1 card from the top of your deck to the top of your Life cards.",
    "K.O. up to 1 of your opponent's Characters with a cost of 5 or less."
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
