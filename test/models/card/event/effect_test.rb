require "test_helper"

class Card::Event::EffectTest < ActiveSupport::TestCase
  EVENT = [
    "[Counter] Look at 5 cards from the top of your deck and play up to 1 {Animal} type Character card with a cost of 3 or less. Then, place the rest at the bottom of your deck in any order.",
    "[Counter] K.O. up to 1 of your opponent's Characters with 6000 base power or less.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, look at 3 cards from the top of your deck; reveal up to 1 {Donquixote Pirates} type Character card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main] If your Leader has the {Supernovas} type, return 1 of your Characters to the owner's hand, and play up to 1 Character card with a cost of 2 or less from your hand that is a different color than the returned Character.",
    "[Counter] If your Leader has the {Impel Down} type, up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, your opponent returns 1 of their active Characters to the owner's hand.",
    "[Counter] Reveal 1 card from the top of your deck. If the revealed card has a cost of 4 or more, return up to 1 of your Characters to the owner's hand. Then, place the revealed card at the bottom of your deck.",
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader's type includes \"Baroque Works\", select 1 of your Characters. Change the attack target to the selected Character.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 8 or less.",
    "[Counter] If you have 30 or more cards in your trash, add up to 1 card from the top of your deck to the top of your Life cards.",
    "[Main] You may trash 2 cards from the top of your deck: K.O. up to 1 of your opponent's Characters with a cost of 5 or less."
  ].freeze

  EVENT.each do |effect|
    test "parse event effect: #{effect}" do
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
