require 'test_helper'

class Card::Event::PTest < ActiveSupport::TestCase
  EFFECT = [
    '[Main] Return all cards in your hand to your deck and shuffle your deck. Then, draw cards equal to the number you returned to your deck.',
    '[Main] Your Leader gains +1000 power for each of your Characters during this turn.',
    "[Main] If your Leader is [Uta], up to 2 of your opponent's rested Characters with a cost of 4 or less will not become active in your opponent's next Refresh Phase.",
    '[Main] If your Leader is [Uta], set all of your {FILM} type Characters as active at the end of this turn.',
    "[Counter] If your Leader is [Uta], you may return any number of Characters on your field to the owner's hand. Up to 1 of your Leader or Character cards gains +2000 power during this battle for every returned Character.",
    "[Main] You may rest 1 of your [Uta] cards: Rest up to 2 of your opponent's DON!! cards."
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    'Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    'Set all of your {FILM} type Characters as active.',
    ''
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
