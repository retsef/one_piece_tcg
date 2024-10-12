require 'test_helper'

class Card::Stage::ST04Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may rest this Stage: If your Leader has the {Animal Kingdom Pirates} type, add up to 1 DON!! card from your DON!! deck and rest it."
  ].freeze

  TRIGGER = [
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST04")
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST04")
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
