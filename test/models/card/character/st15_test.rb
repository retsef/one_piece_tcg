require 'test_helper'

class Card::Character::ST15Test < ActiveSupport::TestCase
  EFFECT = [
    '[When Attacking] If your Leader is [Edward.Newgate], you cannot add Life cards to your hand using your own effects during this turn.',
    "[On Play] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.[Activate: Main] You may rest this Character: K.O. up to 1 of your opponent's Characters with 5000 power or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Opponent's Turn] When this Character is K.O.'d by an effect, up to 1 of your Leader gains +2000 power during this turn.",
    "[On Play] If your Leader's type includes \"Whitebeard Pirates\", give up to 1 of your opponent's Characters −2000 power during this turn. Then, add 1 card from the top of your Life cards to your hand.",
    "If your Leader's type includes \"Whitebeard Pirates\", this Character gains [Rush].(This card can attack on the turn in which it is played.)[Once Per Turn] If this Character would be removed from the field by your opponent's effect, you may give this Character −2000 power during this turn instead."
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST15')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST15')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
