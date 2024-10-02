require 'test_helper'

class Card::Stage::OP08Test < ActiveSupport::TestCase
  EFFECT = [
    "[Opponent's Turn] All of your {Drum Kingdom} type Characters gain +1000 power.",
    "[Activate: Main] You may rest this Stage: If your Leader has the {Minks} type, set up to 1 of your DON!! cards as active.[End of Your Turn] Set up to 1 of your {Minks} type Characters as active.",
    "[Your Turn] [Once Per Turn] When your Character with a type including \"Whitebeard Pirates\" is removed from the field by an effect, draw 1 card. Then, place 1 card from your hand at the top or bottom of your deck."
  ].freeze

  TRIGGER = [
    "",
    "Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
