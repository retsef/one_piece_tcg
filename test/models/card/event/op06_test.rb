require 'test_helper'

class Card::Event::OP06Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main]/[Counter] You may add 1 card from the top of your Life cards to your hand: Up to 1 of your Leader or Character cards gains +3000 power during this turn.",
    "[Main] Up to 1 of your Leader or Character cards gains +3000 power during this turn. Then, if your opponent has a Character with 7000 power or more, up to 1 of your Leader or Character cards gains +1000 power during this turn.",
    "[Main] K.O. up to 1 of your opponent's Characters with 5000 power or less.",
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, if you have 8 or more rested cards, that card gains an additional +2000 power during this battle.",
    "[Main] Choose one:• Rest up to 1 of your opponent's Characters with a cost of 6 or less.• K.O. up to 1 of your opponent's rested Characters with a cost of 6 or less.",
    "[Main] K.O. up to 2 of your opponent's rested Characters with a cost of 3 or less.",
    "[Main] Place up to 1 of your opponent's Characters with a cost of 2 or less and up to 1 of your opponent's Characters with a cost of 1 or less at the bottom of the owner's deck in any order.",
    "[Main] Up to 1 of your Leader or Character cards gains +1000 power during this turn. Then, reveal 1 card from the top of your deck, play up to 1 Character card with a cost of 2, and place the rest at the top or bottom of your deck.",
    "[Main] Place up to 2 Characters with a cost of 6 or less at the bottom of the owner's deck in any order.",
    "[Counter] Up to 1 of your Leader or Character cards gains +1000 power during this turn, and draw 1 card.",
    "[Main] If the number of DON!! cards on your field is equal to or less than the number on your opponent's field,  place up to 1 of your opponent's Characters with a cost of 5 or less at the bottom of the owner's deck.",
    "[Main] Look at 5 cards from the top of your deck; reveal up to 1 card with a type including \"GERMA\" other than [GERMA 66] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main]/[Counter] Your Leader gains +1000 power during this turn. Then, you may K.O. any number of your {Thriller Bark Pirates} type Characters with a cost of 2 or less. Your Leader gains an additional +1000 power during this turn for every Character K.O.'d.",
    "[Counter] You may add 1 card from the top of your Life cards to your hand: Your Characters with a cost of 7 or less cannot be K.O.'d in battle during this turn.",
    "[Main] Trash 1 card from your opponent's hand.",
    "[Counter] You may trash 1 card from your hand: Up to 1 of your Leader or Character cards gains +3000 power during this battle.",
    "[Main] Choose one:• K.O. up to 1 of your opponent's Characters with a cost of 5 or less.• If your opponent has 1 Life card, deal 1 damage to your opponent. Then, add 1 card from the top of your Life cards to your hand."
  ].freeze

  TRIGGER = [
    "",
    "K.O. up to 1 of your opponent's Characters with 5000 power or less.",
    "K.O. up to 1 of your opponent's Characters with 4000 power or less.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "Activate this card's [Main] effect.",
    "Play up to 1 Character card with a cost of 2 from your hand.",
    "Place up to 1 Character with a cost of 5 or less at the bottom of the owner's deck.",
    "Look at 5 cards from the top of your deck and place them at the top or bottom of your deck in any order.",
    "Place up to 1 of your opponent's Characters with a cost of 4 or less at the bottom of the owner's deck.",
    "Draw 1 card.",
    "Draw 2 cards and trash 1 card from your hand.",
    "Activate this card's [Counter] effect.",
    "If you have 0 Life cards, you may add up to 1 card from the top of your deck to the top of your Life cards. Then, trash 1 card from your hand."
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
