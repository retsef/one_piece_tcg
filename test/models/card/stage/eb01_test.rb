require 'test_helper'

class Card::Stage::EB01Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may rest this card and place 1 of your Characters with 1000 base power at the bottom of your deck: Draw 1 card.",
    "[Activate: Main] You may place this card and 1 card from your hand at the bottom of your deck in any order: Draw 2 cards."
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
