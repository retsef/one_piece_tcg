require 'test_helper'

class Card::Character::ST20Test < ActiveSupport::TestCase
  EFFECT = [
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Activate: Main] [Once Per Turn] You may turn 1 card from the top of your Life cards face-up: Give up to 1 rested DON!! card to your Leader or 1 of your Characters.',
    "[Once Per Turn] If this Character would be K.O.'d by an effect, you may trash 1 card from the top of your Life cards instead.",
    '-',
    '[On Play] You may add 1 card from the top of your Life cards to your hand: Set up to 1 of your {Big Mom Pirates} type Characters with a cost of 3 or less as active.',
    "[On Play] You may trash 1 card from your hand: Your opponent chooses one:• Your opponent trashes 2 cards from their hand.• Trash 1 card from the top of your opponent's Life cards."
  ].freeze

  TRIGGER = [
    '',
    'You may trash 1 card from your hand: Play this card.',
    "Look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards. Then, add this card to your hand.",
    "Rest up to 1 of your opponent's Characters with a cost of 3 or less."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST20')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST20')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
