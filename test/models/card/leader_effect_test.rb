require "test_helper"

class Card::Leader::EffectTest < ActiveSupport::TestCase
  LEADER = [
    "[Double Attack] (This card deals 2 damage.)[Activate: Main] [Once Per Turn] If your opponent has 3 or less Life cards, give up to 2 rested DON!! cards to 1 of your Characters.",
    "[Your Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck, draw 1 card.",
    "[DON!! x1] [When Attacking] ➁ (You may rest the specified number of DON!! cards in your cost area.) You may trash 1 card from your hand: Trash 2 cards from the top of your deck and play up to 1 {Thriller Bark Pirates} type Character card with a cost of 4 or less from your trash.",
    "[DON!! x1] [Opponent's Turn] [Once Per Turn] If your Character with 5000 power or more would be K.O.'d, you may give that Character −1000 power during this turn instead of that Character being K.O.'d.",
    "[Activate: Main] [Once Per Turn] You may trash 1 {Revolutionary Army} type card from your hand: Up to 3 of your {Revolutionary Army} type Characters or Characters with a [Trigger] gain +3000 power during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[End of Your Turn] If you have 6 or less cards in your hand, set this Leader as active.",
    "[Activate: Main] [Once Per Turn] You may trash 1 card from your hand: Draw 1 card.[When Attacking] Give up to 1 of your opponent's Characters −1 cost during this turn.",
    "[Activate: Main] [Once Per Turn] You may add 1 card from the top of your Life cards to your hand: If you have 0 or 3 or more DON!! cards on your field, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Opponent's Turn] [Once Per Turn] When your number of Life cards becomes 0, add 1 card from the top of your deck to the top of your Life cards. Then, trash 1 card from your hand.",
    "[Activate: Main] ③ (You may rest the specified number of DON!! cards in your cost area.) You may rest 2 of your {East Blue} type Characters: Set this Leader as active, and rest up to 1 of your opponent's Characters with a cost of 5 or less."
  ].freeze

  LEADER.each do |effect|
    test "parse leader effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
