require 'test_helper'

class Card::Leader::ST01Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] Give this Leader or 1 of your Characters up to 1 rested DON!! card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST01")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
