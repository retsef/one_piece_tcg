require 'test_helper'

class Card::Leader::ST06Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] ③ (You may rest the specified number of DON!! cards in your cost area.) You may trash 1 card from your hand: K.O. up to 1 of your opponent's Characters with a cost of 0."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST06')
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
