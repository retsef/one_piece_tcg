require 'test_helper'

class Card::Leader::ST09Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [Opponent's Turn] If you have 2 or less Life cards, this Leader gains +1000 power."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST09')
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
