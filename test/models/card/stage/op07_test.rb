require 'test_helper'

class Card::Stage::OP07Test < ActiveSupport::TestCase
  EFFECT = [
    "[Activate: Main] You may trash 1 card from your hand and rest this Stage: If your Leader has the {Kuja Pirates} type, return up to 1 of your {Amazon Lily} or {Kuja Pirates} type Characters to the owner's hand.",
    '[End of Your Turn] If you have 3 or less Life cards, set up to 1 {Egghead} type Character with a cost of 5 or less as active.'
  ].freeze

  TRIGGER = [
    '',
    'Play this card.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP07')
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP07')
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
