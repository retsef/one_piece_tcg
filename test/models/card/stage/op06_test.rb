require 'test_helper'

class Card::Stage::OP06Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] Rest all of your opponent's Characters.",
    '[Activate: Main] You may trash 1 card from your hand and rest this Stage: Look at 3 cards from the top of your deck; reveal up to 1 card with a type including "GERMA" and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    '[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area.) You may rest this Stage: If your Leader has the {Thriller Bark Pirates} type, play up to 1 {Thriller Bark Pirates} type Character card with a cost of 2 or less from your trash rested.',
    "[Activate: Main] [Once Per Turn] You may rest this card and 1 of your [Enel] cards: K.O. all of your opponent's Characters with a cost of 2 or less."
  ].freeze

  TRIGGER = [
    'Play this card.',
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP06')
      parsed = Card::Stage::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP06')
      parsed = Card::Stage::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
