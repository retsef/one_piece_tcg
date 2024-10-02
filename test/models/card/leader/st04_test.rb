require 'test_helper'

class Card::Leader::ST04Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] [Once Per Turn] DON!! −7 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Trash up to 1 of your opponent's Life cards."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
