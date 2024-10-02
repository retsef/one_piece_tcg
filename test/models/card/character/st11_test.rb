require 'test_helper'

class Card::Character::ST11Test < ActiveSupport::TestCase
  EFFECT = [
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[End of Your Turn] You may trash 1 Event from your hand: Set up to 1 of your {FILM} type Characters as active."
  ].freeze

  TRIGGER = [
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
