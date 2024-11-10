require 'test_helper'

class Card::Leader::PRB01Test < ActiveSupport::TestCase
  EFFECT = [
    '[Activate: Main] [Once Per Turn] Up to 1 of your Characters without an [On Play] effect and with a cost of 8 or less gains [Rush] during this turn.(This card can attack on the turn in which it is played.)'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('PRB01')
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
