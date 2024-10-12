require 'test_helper'

class Card::Stage::OP02Test < ActiveSupport::TestCase
  EFFECT = [
    "[Your Turn] If you have 1 or less Life cards, your [Edward.Newgate] and all your Characters with a type including \"Whitebeard Pirates\" gain +2000 power.",
    "[Activate: Main] You may trash 1 {Land of Wano} type card from your hand and rest this Stage: Set up to 1 of your DON!! cards as active.",
    "[Activate: Main] You may rest this Stage: If your Leader is [Emporio.Ivankov], draw 1 card and trash 1 card from your hand. Then, trash up to 3 cards from your hand.",
    "[Activate: Main] You may trash 1 card from your hand and rest this Stage: Look at 3 cards from the top of your deck; reveal up to 1 {Impel Down} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order."
  ].freeze

  TRIGGER = [
    "Play this card.",
    ""
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP02")
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("OP02")
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
