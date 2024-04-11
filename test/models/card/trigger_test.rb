require "test_helper"

class Card::TriggerTest < ActiveSupport::TestCase
  CHARACTER = [
    "DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "Give up to a total of 2 of your opponent's Leader or Character cards −3000 power during this turn.",
    "Activate this card's [On Play] effect.",
    "Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "Play up to 1 {Fish-Man} or {Merfolk} type Character card with a cost of 3 or less from your hand.",
    "If your opponent has 3 or less Life cards, play this card.",
    "K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "Up to 1 of your {Land of Wano} type Leader or Character cards gains +2000 power during this turn.",
    "If your Leader is multicolored, play this card.",
    "You may trash 1 card from your hand: If your Leader is multicolored, play this card.",
    "Play this card.",
    "DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Play this card.",
    "If you have 1 or less Life cards, play this card.",
    "Up to 1 of your opponent's Leader or Character cards cannot attack during this turn.",
    "Play this card. Then, K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "If your Leader has the {East Blue} type, play this card.",
    "You may trash 1 card from the top or bottom of your Life cards: Play this card.",
    "Rest up to 1 of your opponent's Characters with a cost of 2 or less and add this card to your hand.",
    "K.O. up to 1 of your opponent's Characters with a cost of 4 or less."
  ].freeze # Character.with_trigger.distinct(:trigger).pluck(:trigger)
  EVENT = [
    "K.O. up to 1 of your opponent's Characters with 5000 base power or less.",
    "Activate this card's [Main] effect.",
    "Return up to 1 Character with a cost of 3 or less to the bottom of the owner's deck.",
    "DON!! −1: Draw 2 cards.",
    "Add up to 1 DON!! card from your DON!! deck and set it as active.",
    "K.O. up to 1 of your opponent's Characters with a cost equal to or less than the total of your and your opponent's Life cards.",
    "Draw 2 cards and trash 1 card from your hand.",
    "K.O. up to 1 of your opponent's Characters with 5000 power or less.",
    "K.O. up to 1 of your opponent's rested Characters with a cost of 3 or less.",
    "Play up to 1 Character card with a cost of 2 from your hand.",
    "Place up to 1 Character with a cost of 5 or less at the bottom of the owner's deck.",
    "Look at 5 cards from the top of your deck and place them at the top or bottom of your deck in any order.",
    "Place up to 1 of your opponent's Characters with a cost of 4 or less at the bottom of the owner's deck.",
    "Activate this card's [Counter] effect.",
    "If you have 0 Life cards, you may add up to 1 card from the top of your deck to the top of your Life cards. Then, trash 1 card from your hand.",
    "Play up to 1 {Revolutionary Army} type Character card with 5000 power or less from your hand.",
    "Draw 3 cards and trash 2 cards from your hand.",
    "You may rest your Leader: K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "Add up to 1 black Character card with a cost of 2 or less from your trash to your hand.",
    "Draw 1 card, look at up to 1 card from the top of your or your opponent's Life cards, and place it at the top or bottom of the Life cards.",
    "Your opponent chooses 1 card from their hand and trashes it.",
    "Draw 1 card and none of your Characters can be K.O.'d during this turn.",
    "Set up to 2 of your DON!! cards as active.",
    "Play up to 1 {Supernovas} type card with a cost of 2 or less from your hand.",
    "K.O. up to 1 of your opponent's [Blocker] Characters with a cost of 3 or less."
  ].freeze # Event.with_trigger.distinct(:trigger).pluck(:trigger)
  STAGE = [
    "Play this card."
  ].freeze # Stage.with_trigger.distinct(:trigger).pluck(:trigger)

  test "parse simple play trigger effect" do
    parsed = Card::Trigger.parse("Play this card.")

    assert_not_nil parsed
  end

  test "parse simple draw trigger effect" do
    parsed = Card::Trigger.parse("Draw 2 cards.")

    assert_equal 1, parsed.effects.size
  end

  test "parse advance draw trigger effect" do
    parsed = Card::Trigger.parse("Draw 2 cards and trash 1 card from your hand.")

    assert_equal 2, parsed.effects.size
  end

  test "parse cost conditional draw trigger effect" do
    parsed = Card::Trigger.parse("DON!! -1: Draw 2 cards.")

    assert_not_nil parsed
  end

  test "parse simple activate trigger effect" do
    parsed = Card::Trigger.parse("Activate this card's [Main] effect.")

    assert_not_nil parsed
  end

  test "parse simple opponent life conditional play trigger effect" do
    parsed = Card::Trigger.parse("If your opponent has 3 or less Life cards, play this card.")

    assert_not_nil parsed
  end

  test "parse simple own life conditional play trigger effect" do
    parsed = Card::Trigger.parse("If you have 2 or less Life cards, play this card.")

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
