require 'test_helper'

class Card::Event::ST02Test < ActiveSupport::TestCase
  EFFECT = [
    '[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, set up to 1 of your DON!! cards as active.',
    '[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, set up to 1 of your DON!! cards as active.',
    "[Main] Rest up to 1 of your opponent's Characters."
  ].freeze

  TRIGGER = [
    'Set up to 2 of your DON!! cards as active.',
    '',
    'Play up to 1 {Supernovas} type card with a cost of 2 or less from your hand.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST02')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST02')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
