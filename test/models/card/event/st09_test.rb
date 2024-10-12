require 'test_helper'

class Card::Event::ST09Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] If you have 2 or less Life cards, give up to 1 of your opponent's Leader or Character cards −3000 power during this turn.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, if you have 2 or less Life cards, add up to 1 of your opponent's Characters with a cost of 3 or less to the top or bottom of the owner's Life cards face-up."
  ].freeze

  TRIGGER = [
    "You may trash 2 cards from your hand: Add up to 1 card from the top of your deck to the top of your Life cards.",
    "Draw 1 card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST09")
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST09")
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
