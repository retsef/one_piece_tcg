require 'test_helper'

class Card::Stage::ST06Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] Give up to 1 of your opponent's Characters −1 cost during this turn.[Activate: Main] You may rest this Stage: If your Leader has the {Navy} type, give up to 1 of your opponent's Characters −1 cost during this turn."
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST06')
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST06')
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
