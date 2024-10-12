require 'test_helper'

class Card::Character::ST14Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [When Attacking] If you have a Character with a cost of 8 or more, K.O. up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[On Play] If you have a Character with a cost of 6 or more, K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[Activate: Main] [Once Per Turn] Up to 1 of your black {Straw Hat Crew} type Characters gains +2 cost until the end of your opponent's next turn.",
    '-',
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If you have 6 or less cards in your hand and a Character with a cost of 8 or more, draw 1 card.',
    "[On Play]/[When Attacking] If you have a Character with a cost of 8 or more, give up to 1 of your opponent's Characters −5 cost during this turn.",
    "[Activate: Main] You may rest this Character: Up to 1 of your black {Straw Hat Crew} type Characters gains +2 cost until the end of your opponent's next turn. Then, if you have a Character with a cost of 8 or more, draw 1 card and trash 1 card from your hand.",
    "[DON!! x1] [Opponent's Turn] If you have a Character with a cost of 6 or more, this Character cannot be K.O.'d by your opponent's effects and gains +2000 power.",
    "[Activate: Main] You may rest this Character: Up to 1 of your black {Straw Hat Crew} type Characters gains +2 cost until the end of your opponent's next turn.",
    'If you have a Character with a cost of 10 or more, this Character gains [Rush].(This card can attack on the turn in which it is played.)'
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST14')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST14')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
