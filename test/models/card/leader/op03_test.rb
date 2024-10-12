require 'test_helper'

class Card::Leader::OP03Test < ActiveSupport::TestCase
  EFFECT = [
    "When this Leader attacks or is attacked, you may trash any number of Event or Stage cards from your hand. This Leader gains +1000 power during this battle for every card trashed.",
    "[Activate: Main] ③ (You may rest the specified number of DON!! cards in your cost area.) You may rest 2 of your {East Blue} type Characters: Set this Leader as active, and rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[DON!! x2] [When Attacking] ① (You may rest the specified number of DON!! cards in your cost area.): Play up to 1 Character card with a cost of 4 or less and a [Trigger] from your hand.",
    "When your deck is reduced to 0, you win the game instead of losing, according to the rules.[DON!! x1] When this Leader's attack deals damage to your opponent's Life, you may trash 1 card from the top of your deck.",
    "This Leader cannot attack.[Activate: Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.) You may rest this Leader: Play up to 1 {Galley-La Company} type Character card with a cost of 5 or less from your hand.",
    "[Your Turn] [Once Per Turn] You may trash 2 cards from your hand: When your opponent's Character is K.O.'d, set this Leader as active.",
    "[DON!! x2] [When Attacking] ② (You may rest the specified number of DON!! cards in your cost area.) You may trash 1 card from your hand: If you have 1 or less Life cards, add up to 1 card from the top of your deck to the top of your Life cards.",
    "[DON!! x1] [When Attacking] Look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards. Then, this Leader gains +1000 power during this battle."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP03")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
