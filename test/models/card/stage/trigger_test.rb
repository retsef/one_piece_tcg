require "test_helper"

class Card::Stage::TriggerTest < ActiveSupport::TestCase
  STAGE = [
    "Play this card."
  ].freeze # Stage.with_trigger.distinct(:trigger).pluck(:trigger)

  STAGE.each do |trigger|
    test "parse stage trigger effect: #{trigger}" do
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
