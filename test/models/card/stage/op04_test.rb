require 'test_helper'

class Card::Stage::OP04Test < ActiveSupport::TestCase
  EFFECT = [
    'If your Leader has the {Dressrosa} type, your {Dressrosa} type Characters can attack Characters on the turn in which they are played.'
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP04')
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP04')
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
