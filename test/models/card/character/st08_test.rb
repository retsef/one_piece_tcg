require 'test_helper'

class Card::Character::ST08Test < ActiveSupport::TestCase
  EFFECT = [
    "This Character cannot be K.O.'d in battle by Leaders.[Activate: Main] You may rest this Character: Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "-",
    "[Activate: Main] You may rest this Character: K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[On Play] You may trash 1 card from your hand: K.O. all Characters with a cost of 1 or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Give up to 1 of your opponent's Characters −4 cost during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Give up to 1 of your opponent's Characters −2 cost during this turn.",
    "[On Play] If there is a Character with a cost of 0, draw 1 card.",
    "[DON!! x1] At the end of a battle in which this Character battles your opponent's Character, you may K.O. the opponent’s Character you battled with. If you do, K.O. this Character."
  ].freeze

  TRIGGER = [
    "",
    "Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST08")
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST08")
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
