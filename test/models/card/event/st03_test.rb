require "test_helper"

class Card::Event::ST03Test < ActiveSupport::TestCase
  EVENT = [
    "[Main] Return up to 1 Character with a cost of 7 or less to the owner's hand.",
    "[Counter] Return up to 1 Character with a cost of 3 or less to the owner's hand.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, draw 1 card if you have 3 or less cards in your hand."
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    "Activate this card's [Counter] effect.",
    ""
  ].freeze

  EVENT.each do |effect|
    test "parse event effect: #{effect}" do
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse event trigger: #{trigger}" do
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
