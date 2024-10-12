require 'test_helper'

class Card::Stage::ST07Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may rest this Stage and add 1 card from the top or bottom of your Life cards to your hand: Add up to 1 of your Characters with a cost of 3 to the top of the owner's Life cards face-up."
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST07')
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST07')
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
