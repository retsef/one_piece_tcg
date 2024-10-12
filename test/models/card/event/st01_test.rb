require 'test_helper'

class Card::Event::ST01Test < ActiveSupport::TestCase
  EFFECT = [
    '[Counter] Up to 1 of your Leader or Character cards gains +3000 power during this battle.',
    "[Main] K.O. up to 1 of your opponent's Characters with 6000 power or less.",
    '[Main] Select up to 1 of your {Straw Hat Crew} type Leader or Character cards. Your opponent cannot activate [Blocker] if that Leader or Character attacks during this turn.'
  ].freeze

  TRIGGER = [
    'Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    "Activate this card's [Main] effect.",
    "K.O. up to 1 of your opponent's [Blocker] Characters with a cost of 3 or less."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST01')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST01')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
