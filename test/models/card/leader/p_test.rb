require 'test_helper'

class Card::Leader::PTest < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] ① (You may rest the specified number of DON!! cards in your cost area.): Up to 1 of your Characters with no base effect gains +2000 power during this turn.",
    "[DON!! x1] [When Attacking] Draw 1 card if you have 3 or less cards in your hand.",
    "[Activate: Main] [Once Per Turn] You may trash 1 {Navy} type card from your hand: Give up to 1 of your opponent's Characters －1 cost during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("P")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
