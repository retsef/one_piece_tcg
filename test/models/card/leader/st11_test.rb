require 'test_helper'

class Card::Leader::ST11Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [When Attacking] [Once Per Turn] Reveal 1 card from the top of your deck and add up to 1 {FILM} type card to your hand. Then, place the rest at the bottom of your deck."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST11")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
