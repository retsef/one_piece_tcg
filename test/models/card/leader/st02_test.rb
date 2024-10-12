require 'test_helper'

class Card::Leader::ST02Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn]  ③ (You may rest the specified number of DON!! cards in your cost area.) You may trash 1 card from your hand: Set this Leader as active."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST02")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
