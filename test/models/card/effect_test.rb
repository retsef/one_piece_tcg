require "test_helper"

class Card::EffectTest < ActiveSupport::TestCase
  test "parse leader ability" do
    effect = "[Activate: Main] [Once Per Turn] Give this Leader or 1 of your Characters up to 1 rested DON!! card."
    parsed = Card::Effect.parse(effect)

    assert_not_nil parsed
  end

  test "parse trigger effect" do
    effect = "Draw 1 card."
    parsed = Card::Effect.parse(effect)

    assert_not_nil parsed
  end

  test "parse on play effect" do
    effect = "[On Play] Draw 1 card."
    parsed = Card::Effect.parse(effect)

    assert_not_nil parsed
  end

  test "parse main effect" do
    effect = "[Main] You may rest this character: Draw 1 card."
    parsed = Card::Effect.parse(effect)

    assert_not_nil parsed
  end
end
