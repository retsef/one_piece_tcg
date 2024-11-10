require 'test_helper'

class Card::Character::ST16Test < ActiveSupport::TestCase
  EFFECT = [
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Activate: Main] [Once Per Turn] You may trash 1 {FILM} type card from your hand: Give up to 1 rested DON!! card to your Leader or 1 of your Characters.',
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Your Opponent's Attack] You may trash any number of {Music} type cards from your hand. Your Leader or 1 of your Characters gains +1000 power during this battle for every card trashed.",
    'If your Leader has the {FILM} type and you have 6 or more rested cards, this Character gains +2000 power.',
    "[On Play] K.O. up to 1 of your opponent's rested Characters.",
    'If you have a rested [Uta], this Character gains +1000 power.'
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST16')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST16')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
