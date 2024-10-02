require 'test_helper'

class Card::Leader::ST05Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] DON!! −3 (You may return the specified number of DON!! cards from your field to your DON!! deck.): All of your {FILM} type Characters gain +2000 power during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
