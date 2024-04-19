require "test_helper"

class Card::Leader::ST01Test < ActiveSupport::TestCase
  LEADER = [
    "[Activate: Main] [Once Per Turn] Give this Leader or 1 of your Characters up to 1 rested DON!! card."
  ].freeze

  LEADER.each do |effect|
    test "parse leader effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
