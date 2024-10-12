require 'test_helper'

class Card::Leader::OP06Test < ActiveSupport::TestCase
  EFFECT = [
    "[When Attacking] You may trash 1 {FILM} type card from your hand: Give up to 1 of your opponent's Characters −2000 power during this turn. Then, add up to 1 DON!! card from your DON!! deck and rest it.",
    "[Activate: Main] You may rest this Leader: Rest up to 1 of your opponent's DON!! cards or Characters with a cost of 3 or less. Then, you cannot add Life cards to your hand using your own effects during this turn.",
    "[Activate: Main] [Once Per Turn] Choose one:• Rest up to 1 of your opponent's Characters with a cost of 4 or less.• Give up to 1 of your opponent's Characters −1 cost during this turn.",
    "[Double Attack] (This card deals 2 damage.)[Activate: Main] [Once Per Turn] If your opponent has 3 or less Life cards, give up to 2 rested DON!! cards to 1 of your Characters.",
    "[Your Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck, draw 1 card.",
    "[DON!! x1] [When Attacking] ➁ (You may rest the specified number of DON!! cards in your cost area.) You may trash 1 card from your hand: Trash 2 cards from the top of your deck and play up to 1 {Thriller Bark Pirates} type Character card with a cost of 4 or less from your trash."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP06")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
