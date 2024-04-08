require "test_helper"

class Card::TriggerTest < ActiveSupport::TestCase
  CHARACTER = [
    "",
    "DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "Give up to a total of 2 of your opponent's Leader or Character cards −3000 power during this turn.",
    "Activate this card's [On Play] effect.",
    "Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "Play up to 1 {Fish-Man} or {Merfolk} type Character card with a cost of 3 or less from your hand.",
    "If your opponent has 3 or less Life cards, play this card.",
    "K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "If you have 2 or less Life cards, play this card.",
    "Up to 1 of your {Land of Wano} type Leader or Character cards gains +2000 power during this turn."
  ].freeze
  EVENT = [
    "",
    "K.O. up to 1 of your opponent's Characters with 5000 base power or less.",
    "Activate this card's [Main] effect.",
    "Return up to 1 Character with a cost of 3 or less to the bottom of the owner's deck.",
    "Return up to 1 Character with a cost of 8 or less to the owner's hand.",
    "DON!! −1: Draw 2 cards.",
    "Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "K.O. up to 1 of your opponent's Characters with a cost equal to or less than the total of your and your opponent's Life cards.",
    "Draw 2 cards and trash 1 card from your hand.",
    "K.O. up to 1 of your opponent's Characters with 5000 power or less."
  ].freeze
  STAGE = [
    "",
    "Play this card."
  ].freeze

  test "parse simple play trigger effect" do
    parsed = Card::Trigger.parse("Play this card.")

    assert_not_nil parsed
  end

  test "parse simple draw trigger effect" do
    parsed = Card::Trigger.parse("Draw 2 cards.")

    assert_not_nil parsed
  end

  test "parse advance draw trigger effect" do
    parsed = Card::Trigger.parse("Draw 2 cards and trash 1 card from your hand.")

    assert_not_nil parsed
  end

  test "parse simple activate trigger effect" do
    parsed = Card::Trigger.parse("Activate this card's [Main] effect.")

    assert_not_nil parsed
  end

  CHARACTER.each do |trigger|
    test "parse character trigger effect: #{trigger}" do
      parsed = Card::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end

  EVENT.each do |trigger|
    test "parse event trigger effect: #{trigger}" do
      parsed = Card::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end

  STAGE.each do |trigger|
    test "parse stage trigger effect: #{trigger}" do
      parsed = Card::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
