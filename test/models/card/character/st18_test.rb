require 'test_helper'

class Card::Character::ST18Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] If you have 8 or more DON!! cards on your field, rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If you have 8 or more DON!! cards on your field, trash 1 card from your hand and draw 2 cards.',
    '[When Attacking] [Once Per Turn] If you have 8 or more DON!! cards on your field, draw 1 card.',
    '[On Play] Look at 5 cards from the top of your deck; reveal up to 1 purple {Straw Hat Crew} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    '[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play up to 1 purple {Straw Hat Crew} type Character card with a cost of 5 or less from your hand.'
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST18')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST18')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
