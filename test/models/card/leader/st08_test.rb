require 'test_helper'

class Card::Leader::ST08Test < ActiveSupport::TestCase
  EFFECT = [
    "[Your Turn] When a Character is K.O.'d, give up to 1 rested DON!! card to this Leader."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST08")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
