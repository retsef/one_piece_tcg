require 'test_helper'

class Card::Leader::ST14Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] All of your Characters gain +1 cost. If you have a Character with a cost of 8 or more, this Leader gains +1000 power."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
