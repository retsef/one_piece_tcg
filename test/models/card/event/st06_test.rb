require 'test_helper'

class Card::Event::ST06Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, K.O. up to 1 of your opponent's active Characters with a cost of 3 or less.",
    "[Main] Draw 1 card. Then, give up to 1 of your opponent's Characters −2 cost during this turn.",
    '[Counter] Up to 1 of your Leader or Character cards gains +2000 power during this battle.'
  ].freeze

  TRIGGER = [
    "K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    'Your opponent chooses 1 card from their hand and trashes it.',
    "Draw 1 card and none of your Characters can be K.O.'d during this turn."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST06')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST06')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
