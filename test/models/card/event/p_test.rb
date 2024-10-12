require 'test_helper'

class Card::Event::PTest < ActiveSupport::TestCase
  EFFECT = [
    '[Main] Return all cards in your hand to your deck and shuffle your deck. Then, draw cards equal to the number you returned to your deck.',
    '[Main] Your Leader gains +1000 power for each of your Characters during this turn.'
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    'Up to 1 of your Leader or Character cards gains +1000 power during this turn.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('P')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('P')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
