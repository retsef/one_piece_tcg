require "test_helper"

class Card::Event::OP02Test < ActiveSupport::TestCase
  EVENT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +6000 power during this battle. Then, play up to 1 Character card with a cost of 3 or less and no base effect from your hand.",
    "[Main] If your Leader's type includes \"Whitebeard Pirates\", K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[Main] Look at 5 cards from the top of your deck; reveal up to 1 Character card with a type including \"Whitebeard Pirates\" and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main] If you have 3 or less Life cards, you cannot add Life cards to your hand using your own effects during this turn.",
    "[Main] K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    "[Main] Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[Main] You may trash 2 cards from your hand: If your Leader has the {Impel Down} type, draw up to 2 cards.",
    "[Main] Return up to 1 Character with a cost of 4 or less to the owner's hand.",
    "[Counter] You may trash 1 card from your hand: Up to 1 of your Leader or Character cards gains +3000 power during this battle.",
    "[Counter] Up to 1 of your Leader or Character cards gains +6000 power during this battle. Then, draw cards so that you have 2 cards in your hand.",
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Give up to a total of 2 of your opponent's Leader or Character cards −3000 power during this turn.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[Main] Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Main] Give up to 1 of your opponent's Characters −5 cost during this turn.",
    "[Counter] You may trash 1 card from your hand: Select up to 1 of your Characters. The selected Character cannot be K.O.'d during this battle.",
    "[Main] K.O. up to 1 of your opponent's Characters with a cost of 1 or less."
  ].freeze

  TRIGGER = [
    "Rest up to 1 of your opponent's Leader or Character cards with a cost of 5 or less.",
    "Give up to 1 of your opponent's Leader or Character cards −3000 power during this turn.",
    "Activate this card's [Main] effect.",
    "Up to 1 of your Leader gains +1000 power during this turn.",
    "Play up to 1 Character card with a cost of 4 or less and no base effect from your hand.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "Draw 2 cards.",
    "Return up to 1 Character with a cost of 2 or less to the owner's hand.",
    "Return up to 1 Character with a cost of 7 or less to the owner's hand.",
    "If your opponent has 6 or more DON!! cards on their field, your opponent returns 1 DON!! card from their field to their DON!! deck.",
    "K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "K.O. up to 1 of your opponent's Stages with a cost of 3 or less.",
    "Draw 2 cards and trash 1 card from your hand."
  ].freeze

  EVENT.each do |effect|
    test "parse event effect: #{effect}" do
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse event trigger: #{trigger}" do
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
