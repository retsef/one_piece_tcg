require "test_helper"

class Card::EffectTest < ActiveSupport::TestCase
  LEADER = [
    "[Double Attack] (This card deals 2 damage.)[Activate: Main] [Once Per Turn] If your opponent has 3 or less Life cards, give up to 2 rested DON!! cards to 1 of your Characters.",
    "[Your Turn] [Once Per Turn] When a DON!! card on your field is returned to your DON!! deck, draw 1 card.",
    "[DON!! x1] [When Attacking] ➁ (You may rest the specified number of DON!! cards in your cost area.) You may trash 1 card from your hand: Trash 2 cards from the top of your deck and play up to 1 {Thriller Bark Pirates} type Character card with a cost of 4 or less from your trash.",
    "[DON!! x1] [Opponent's Turn] [Once Per Turn] If your Character with 5000 power or more would be K.O.'d, you may give that Character −1000 power during this turn instead of that Character being K.O.'d.",
    "[Activate: Main] [Once Per Turn] You may trash 1 {Revolutionary Army} type card from your hand: Up to 3 of your {Revolutionary Army} type Characters or Characters with a [Trigger] gain +3000 power during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[End of Your Turn] If you have 6 or less cards in your hand, set this Leader as active.",
    "[Activate: Main] [Once Per Turn] You may trash 1 card from your hand: Draw 1 card.[When Attacking] Give up to 1 of your opponent's Characters −1 cost during this turn.",
    "[Activate: Main] [Once Per Turn] You may add 1 card from the top of your Life cards to your hand: If you have 0 or 3 or more DON!! cards on your field, add up to 1 DON!! card from your DON!! deck and set it as active.",
    "[Opponent's Turn] [Once Per Turn] When your number of Life cards becomes 0, add 1 card from the top of your deck to the top of your Life cards. Then, trash 1 card from your hand.",
    "[Activate: Main] ③ (You may rest the specified number of DON!! cards in your cost area.) You may rest 2 of your {East Blue} type Characters: Set this Leader as active, and rest up to 1 of your opponent's Characters with a cost of 5 or less."
  ].freeze
  CHARACTER = [
    "[On Play] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.[On Your Opponent's Attack] [Once Per Turn] You may trash 1 card from your hand: If your Leader has the {Land of Wano} or {Whitebeard Pirates} type, give up to 1 of your opponent's Leader or Character cards −2000 power during this turn.",
    "[Rush] (This card can attack on the turn in which it is played.)[When Attacking] If your opponent has 2 or less Life cards, this Character gains +2000 power during this turn.",
    "[When Attacking] You may give your 1 active Leader −5000 power during this turn: Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "-",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x2] [When Attacking] Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[Activate: Main] [Once Per Turn] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.",
    "[Once Per Turn] If this Character would be K.O.'d by an effect, you may trash 1 Event or Stage card from your hand instead.",
    "[On Play]/[When Attacking] If your Leader has the {Supernovas} type and you have no other [Cavendish] Characters, set up to 2 of your DON!! cards as active.",
    "[Activate: Main] You may trash this Character: Play up to 1 {Land of Wano} type Character card with a cost of 5 or less other than [Kouzuki Hiyori] from your hand. Then, draw 1 card.",
    "[DON!! x1] [Your Turn] This Character gains +1000 power for every 3 of your rested DON!! cards.",
    "[End of Your Turn] ①: Set this Character as active.[Once Per Turn] If this Character would be K.O.'d, you may rest up to 1 of your Characters with a cost of 3 or more other than [Pica] instead.",
    "[On Play] ① (You may rest the specified number of DON!! cards in your cost area.): Add up to 1 DON!! card from your DON!! deck and rest it."
  ].freeze
  EVENT = [
    "[Counter] Look at 5 cards from the top of your deck and play up to 1 {Animal} type Character card with a cost of 3 or less. Then, place the rest at the bottom of your deck in any order.",
    "[Counter] K.O. up to 1 of your opponent's Characters with 6000 base power or less.",
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, look at 3 cards from the top of your deck; reveal up to 1 {Donquixote Pirates} type Character card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Main] If your Leader has the {Supernovas} type, return 1 of your Characters to the owner's hand, and play up to 1 Character card with a cost of 2 or less from your hand that is a different color than the returned Character.",
    "[Counter] If your Leader has the {Impel Down} type, up to 1 of your Leader or Character cards gains +2000 power during this battle. Then, your opponent returns 1 of their active Characters to the owner's hand.",
    "[Counter] Reveal 1 card from the top of your deck. If the revealed card has a cost of 4 or more, return up to 1 of your Characters to the owner's hand. Then, place the revealed card at the bottom of your deck.",
    "[Counter] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader's type includes \"Baroque Works\", select 1 of your Characters. Change the attack target to the selected Character.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 8 or less.",
    "[Counter] If you have 30 or more cards in your trash, add up to 1 card from the top of your deck to the top of your Life cards.",
    "[Main] You may trash 2 cards from the top of your deck: K.O. up to 1 of your opponent's Characters with a cost of 5 or less."
  ].freeze
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

  CHARACTER.each do |effect|
    test "parse character effect: #{effect}" do
      parsed = Card::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  EVENT.each do |effect|
    test "parse event effect: #{effect}" do
      parsed = Card::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  STAGE.each do |effect|
    test "parse stage effect: #{effect}" do
      parsed = Card::Trigger.parse(effect)

      assert_not_nil parsed
    end
  end
end
