require 'test_helper'

class Card::Leader::ST12Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [When Attacking] [Once Per Turn] You may return 1 of your Characters with a cost of 2 or more to the owner's hand: Set up to 1 of your Characters with 7000 power or less as active."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST12")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
