require 'test_helper'

class Card::Character::ST07Test < ActiveSupport::TestCase
  EFFECT = [
    '-',
    "[On Play] Look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards. Then, if you have less Life cards than your opponent, this Character gains [Rush] during this turn.(This card can attack on the turn in which it is played.)",
    '[DON!! x1] [When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: This Character gains [Banish] and +1000 power during this battle.(When this card deals damage, the target card is trashed without activating its Trigger.)',
    '[DON!! x1] [When Attacking] You may add 1 card from the top or bottom of your Life cards to your hand: Add up to 1 card from the top of your deck to the top of your Life cards.',
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)',
    "[On Play] Look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards.",
    "[Activate: Main] You may rest this Character and add 1 card from the top or bottom of your Life cards to your hand: K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[On Play] Your opponent chooses one:- Trash 1 card from the top of your opponent's Life cards.- Add 1 card from the top of your deck to the top of your Life cards.",
    '[Activate: Main] You may rest this Character: Up to 1 of your [Charlotte Linlin] cards gains [Banish] during this turn.(When this card deals damage, the target card is trashed without activating its Trigger.)',
    '[Activate: Main] You may rest this Character: Up to 1 of your [Charlotte Linlin] cards gains [Double Attack] during this turn.(This card deals 2 damage.)'
  ].freeze

  TRIGGER = [
    '',
    'Play this card.',
    'You may trash 1 card from your hand: Play this card.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST07')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST07')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
