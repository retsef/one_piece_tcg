require 'test_helper'

class Card::Event::OP08Test < ActiveSupport::TestCase
  EFFECT = [
    "[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, give up to 1 of your opponent's Leader or Character cards −1000 power during this turn.",
    "[Main] Up to 3 of your Characters gain +1000 power during this turn. Then, give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[Main]/[Counter] Give up to 1 of your opponent's Characters −3000 power during this turn. Then, up to 1 of your Characters gains +3000 power during this turn.",
    "[Main] All of your opponent's rested Characters with a cost of 7 or less will not become active in your opponent's next Refresh Phase.",
    "[Main] You may rest 1 of your {Minks} type Characters: Rest up to 1 of your opponent's Characters.",
    "[Main] You may rest 2 of your Characters: None of your Characters can be K.O.'d by your opponent's effects until the end of your opponent's next turn.",
    "[Main] If your Leader's type includes \"Whitebeard Pirates\", look at 3 cards from the top of your deck; reveal up to 1 card with a type including \"Whitebeard Pirates\" or [Monkey.D.Luffy] and add it to your hand. Then, place the rest at the top or bottom of your deck in any order.",
    '[Counter] Up to 1 of your Leader or Character cards gains +3000 power during this battle. Then, reveal 1 card from the top of your deck and play up to 1 Character card with a type including "Whitebeard Pirates" and a cost of 3 or less. Then, place the rest at the top or bottom of your deck.',
    "[Main] You may reveal 2 cards with a type including \"Whitebeard Pirates\" from your hand: Place up to 1 Character with a cost of 6 or less at the bottom of the owner's deck.",
    "[Main] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Rest up to 1 of your opponent's Characters with a cost of 2 or less. Then, turn all of your Life cards face-down.",
    '[Main] Add up to 1 DON!! card from your DON!! deck and set it as active. Then, if your opponent has a Character with 6000 power or more, add up to 1 DON!! card from your DON!! deck and set it as active.',
    "[Main] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Animal Kingdom Pirates} or {Big Mom Pirates} type, K.O. up to 2 of your opponent's Characters with a cost of 6 or less.",
    "[Main]/[Counter] You may place 3 cards from your trash at the bottom of your deck in any order: K.O. up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[Main] If you have 10 or more cards in your trash, up to 1 of your Characters gains +2000 power until the end of your opponent's next turn.",
    '[Counter] Trash 1 card from the top of your deck. If the trashed card has a cost of 6 or more, up to 1 of your Leader or Character cards gains +5000 power during this battle.',
    "[Main] If your Leader has the {Animal Kingdom Pirates} type, give up to 1 of your opponent's Characters −2 cost during this turn. Then, K.O. up to 1 of your opponent's Characters with a cost of 0.",
    '[Counter] If your Leader has the {Shandian Warrior} type, up to 1 of your Leader or Character cards gains +3000 power during this battle. Then, play up to 1 [Upper Yard] from your hand.',
    '[Counter] Up to 1 of your Leader or Character cards gains +4000 power during this battle. Then, you may add 1 card from the top or bottom of your Life cards to your hand. If you do, add up to 1 {Shandian Warrior} type card from your hand to the top of your Life cards face-up.',
    "[Main] You may trash 1 card from the top of your Life cards: K.O. up to 1 of your opponent's Characters with a cost of 7 or less."
  ].freeze

  TRIGGER = [
    'Up to 1 of your Leader or Character cards gains +1000 power during this turn.',
    "Give up to 1 of your opponent's Leader or Character cards −3000 power during this turn.",
    "K.O. up to 1 of your opponent's Characters with 5000 power or less.",
    "Rest up to 1 of your opponent's Characters.",
    'Draw 1 card.',
    "Rest up to 1 of your opponent's Characters with a cost of 3 or less.",
    '',
    'Add up to 1 DON!! card from your DON!! deck and set it as active.',
    "Activate this card's [Main] effect.",
    'Up to 1 of your Leader or Character cards gains +2000 power during this turn.',
    'Play up to 1 black Character card with a cost of 3 or less from your trash.',
    "K.O. up to 1 of your opponent's Characters with a cost of 3 or less.",
    'Draw 2 cards and trash 1 card from your hand.',
    'You may add 1 card from the top of your Life cards to your hand: Add up to 1 card from your hand to the top of your Life cards.'
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP08')
      parsed = Card::Event::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('OP08')
      parsed = Card::Event::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
