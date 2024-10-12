require 'test_helper'

class Card::Leader::EB01Test < ActiveSupport::TestCase
  EFFECT = [
    'All of your {Land of Wano} type Character cards without a Counter have a +1000 Counter, according to the rules.[DON!! x1] [When Attacking] If you have a {Land of Wano} type Character with a cost of 5 or more, this Leader gains +1000 power until the start of your next turn.',
    "[End of Your Turn] You may return 1 of your {Impel Down} type Characters with a cost of 2 or more to the owner's hand: Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Activate: Main] [Once Per Turn] You may turn 1 card from the top of your Life cards face-up: K.O. up to 1 of your opponent's Characters with a cost of 0."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('EB01')
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
