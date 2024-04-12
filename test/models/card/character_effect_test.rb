require "test_helper"

class Card::Character::EffectTest < ActiveSupport::TestCase
  CHARACTER = [
    "[On Play] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.[On Your Opponent's Attack] [Once Per Turn] You may trash 1 card from your hand: If your Leader has the {Land of Wano} or {Whitebeard Pirates} type, give up to 1 of your opponent's Leader or Character cards −2000 power during this turn.",
    "[Rush] (This card can attack on the turn in which it is played.)[When Attacking] If your opponent has 2 or less Life cards, this Character gains +2000 power during this turn.",
    "[When Attacking] You may give your 1 active Leader −5000 power during this turn: Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x2] [When Attacking] Give up to 1 of your opponent's Characters −3000 power during this turn.",
    "[Activate: Main] [Once Per Turn] Give up to 1 rested DON!! card to your Leader or 1 of your Characters.",
    "[Once Per Turn] If this Character would be K.O.'d by an effect, you may trash 1 Event or Stage card from your hand instead.",
    "[On Play]/[When Attacking] If your Leader has the {Supernovas} type and you have no other [Cavendish] Characters, set up to 2 of your DON!! cards as active.",
    "[Activate: Main] You may trash this Character: Play up to 1 {Land of Wano} type Character card with a cost of 5 or less other than [Kouzuki Hiyori] from your hand. Then, draw 1 card.",
    "[DON!! x1] [Your Turn] This Character gains +1000 power for every 3 of your rested DON!! cards.",
    "[On Play] Up to 1 of your red Characters with a cost of 1 gains +3000 power during this turn.",
    "[End of Your Turn] ①: Set this Character as active.[Once Per Turn] If this Character would be K.O.'d, you may rest up to 1 of your Characters with a cost of 3 or more other than [Pica] instead.",
    "[On Play] ① (You may rest the specified number of DON!! cards in your cost area.): Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] Draw 1 card."
  ].freeze

  CHARACTER.each do |effect|
    test "parse character effect: #{effect}" do
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
