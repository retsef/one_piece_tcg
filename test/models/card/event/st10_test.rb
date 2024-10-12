require 'test_helper'

class Card::Event::ST10Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle, and K.O. up to 1 of your opponent's Characters with 2000 power or less.",
    "[Main] K.O. up to 1 of your opponent's Characters with 7000 power or less.",
    "[Main] Rest up to 1 of your opponent's Characters with a cost of 2 or less, and add up to 1 DON!! card from your DON!! deck and rest it."
  ].freeze

  TRIGGER = [
    '',
    'Up to 1 of your Leader gains +1000 power until the end of your next turn.',
    'Add up to 1 DON!! card from your DON!! deck and set it as active.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST10')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST10')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
