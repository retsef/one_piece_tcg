require 'test_helper'

class Card::Leader::ST13Test < ActiveSupport::TestCase
  EFFECT = [
    "[DON!! x1] [Activate: Main] [Once Per Turn] You may add 1 of your Characters with a cost of 3 or more and 7000 power or more to the top of your Life cards face-up: Up to 1 of your Characters gains +2000 power until the start of your next turn.",
    "[DON!! x2] [Activate: Main] [Once Per Turn] Look at 5 cards from the top of your deck and add up to 1 Character card with a cost of 5 to the top of your Life cards face-up. Then, place the rest at the bottom of your deck in any order.[End of Your Turn] Trash all your face-up Life cards.",
    "Your face-up Life cards are placed at the bottom of your deck instead of being added to your hand, according to the rules.[DON!! x2] [Activate: Main] [Once Per Turn] You may trash 1 card from your hand: If you have 0 Life cards, add up to 2 Character cards with a cost of 5 from your hand or trash to the top of your Life cards face-up."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("ST13")
      parsed = Card::Leader::Effect.parse(effect)

      assert_not_nil parsed
    end
  end
end
