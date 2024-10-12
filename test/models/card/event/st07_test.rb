require 'test_helper'

class Card::Event::ST07Test < ActiveSupport::TestCase
  EFFECT = [
    "[Main] Your opponent chooses one:- Trash 1 card from the top of your opponent's Life cards.- Add 1 card from the top of your deck to the top of your Life cards.",
    "[Counter] Look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards. Then, up to 1 of your Leader or Character cards gains +2000 power during this battle."
  ].freeze

  TRIGGER = [
    "Activate this card's [Main] effect.",
    "Draw 1 card, look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST07")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST07")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
