require 'test_helper'

class Card::Character::ST19Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] You may trash 1 black {Navy} type card from your hand: Up to 2 of your opponent's Characters with a cost of 4 or less cannot attack until the end of your opponent's next turn.",
    '[On Play] You may trash 2 black {Navy} type cards from your hand: If your Leader has the {Navy} type, draw 3 cards.',
    "[On Play] If your Leader is [Smoker], give up to 1 of your opponent's Characters −4 cost during this turn.[Activate: Main] [Once Per Turn] If this Character was played on this turn, trash up to 1 of your opponent's Characters with a cost of 0.",
    "[DON!! x1] [Opponent's Turn] This Character gains +4 cost.[Activate: Main] [Once Per Turn] You may place 1 card from your trash at the bottom of your deck: Give up to 1 rested DON!! card to your Leader or 1 of your Characters.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[Activate: Main] [Once Per Turn] You may place 1 card from your trash at the bottom of your deck: Give up to 1 of your opponent's Characters −1 cost during this turn."
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST19')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST19')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
