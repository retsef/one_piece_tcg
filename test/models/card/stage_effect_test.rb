require "test_helper"

class Card::Stage::EffectTest < ActiveSupport::TestCase
  STAGE = [
    "[Activate: Main] You may rest this card and place 1 of your Characters with 1000 base power at the bottom of your deck: Draw 1 card.",
    "[Activate: Main] You may place this card and 1 card from your hand at the bottom of your deck in any order: Draw 2 cards.",
    "[On Play] Rest all of your opponent's Characters.",
    "[Activate: Main] You may trash 1 card from your hand and rest this Stage: Look at 3 cards from the top of your deck; reveal up to 1 card with a type including \"GERMA\" and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Stage: If your Leader has the {Thriller Bark Pirates} type, play up to 1 {Thriller Bark Pirates} type Character card with a cost of 2 or less from your trash rested.",
    "[Activate: Main] [Once Per Turn] You may rest this card and 1 of your [Enel] cards: K.O. all of your opponent's Characters with a cost of 2 or less.",
    "[Activate: Main] You may trash 1 card from your hand and rest this Stage: Look at 3 cards from the top of your deck; reveal up to 1 {Revolutionary Army} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "If your Leader is [Donquixote Doflamingo], all Characters with a cost of 5 or less do not become active in your and your opponent's Refresh Phases.[End of Your Turn] If you have 10 DON!! cards on your field, K.O. all rested Characters with a cost of 5 or less. Then, trash this Stage.",
    "[Your Turn] The cost of playing {Celestial Dragons} type Character cards with a cost of 2 or more from your hand will be reduced by 1.",
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Sky Island} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order."
  ].freeze

  STAGE.each do |effect|
    test "parse stage effect: #{effect}" do
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
