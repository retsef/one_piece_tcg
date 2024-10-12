require 'test_helper'

class Card::Event::ST08Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] You may add 1 card from the top of your Life cards to your hand: Give up to 1 of your opponent's Characters −7 cost during this turn.",
    "[Main] K.O. up to 1 of your opponent's Characters with a cost of 2 or less."
  ].freeze

  TRIGGER = [
    'Add up to 1 black Character card with a cost of 2 or less from your trash to your hand.',
    'Draw 1 card.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST08')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST08')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
