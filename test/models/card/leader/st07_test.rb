require 'test_helper'

class Card::Leader::ST07Test < ActiveSupport::TestCase
  EFFECT = [
    '[DON!! x2] [When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: If you have 2 or less Life cards, add up to 1 card from your hand to the top of your Life cards.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST07')
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
