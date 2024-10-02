require 'test_helper'

class Card::Stage::OP05Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may trash 1 card from your hand and rest this Stage: Look at 3 cards from the top of your deck; reveal up to 1 {Revolutionary Army} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "If your Leader is [Donquixote Doflamingo], all Characters with a cost of 5 or less do not become active in your and your opponent's Refresh Phases.[End of Your Turn] If you have 10 DON!! cards on your field, K.O. all rested Characters with a cost of 5 or less. Then, trash this Stage.",
    "[Your Turn] The cost of playing {Celestial Dragons} type Character cards with a cost of 2 or more from your hand will be reduced by 1.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Sky Island} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order."
  ].freeze

  TRIGGER = [
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
