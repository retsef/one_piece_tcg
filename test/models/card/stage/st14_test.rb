require 'test_helper'

class Card::Stage::ST14Test < ActiveSupport::TestCase
  EFFECT = [
    "All of your black {Straw Hat Crew} type Characters gain +1 cost.[On Play] If your Leader has the {Straw Hat Crew} type, draw 1 card."
  ].freeze

  TRIGGER = [
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST14")
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST14")
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
