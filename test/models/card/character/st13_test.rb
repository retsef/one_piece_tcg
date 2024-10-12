require 'test_helper'

class Card::Character::ST13Test < ActiveSupport::TestCase
  EFFECT = [
    '[On Play] Add 1 card from the top of your deck to the top of your Life cards. Then, look at all your Life cards; place 1 card at the top of your deck and place the rest back in your Life area in any order.',
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] You may trash 1 card from the top or bottom of your Life cards: Reveal up to 1 Character card with a cost of 5 from your hand and add it to the top of your Life cards face-down.',
    '[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Play up to 1 each of [Sabo], [Portgas.D.Ace], and [Monkey.D.Luffy] with a cost of 2 from your hand.',
    "[Activate: Main] You may trash this Character: Reveal 1 card from the top of your Life cards. If that card is a [Sabo] with a cost of 5, you may play that card. If you do, up to 1 of your Leader gains +2000 power until the end of your opponent's next turn.",
    "[On Play] You may trash 1 card from the top or bottom of your Life cards: K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[On Play] You may turn 1 of your face-up Life cards face-down: If your opponent has 7 or more cards in their hand, trash up to 1 card from the top of your opponent's Life cards.",
    "[Activate: Main] You may trash this Character: Reveal 1 card from the top of your Life cards. If that card is a [Portgas.D.Ace] with a cost of 5, you may play that card. If you do, up to 1 of your Leader gains +2000 power until the end of your opponent's next turn.",
    '[On Play] If you have 2 or less Life cards, this Character gains [Rush].(This card can attack on the turn in which it is played.)',
    '[On Play] You may add 1 card from the top or bottom of your Life cards to your hand: Look at all of your Life cards and place them back in your Life area in any order.',
    '[On Play] Look at 5 cards from the top of your deck; reveal up to 1 [Sabo], [Portgas.D.Ace], or [Monkey.D.Luffy] with a cost of 5 or less and add it to your hand. Then, place the rest at the bottom of your deck in any order.',
    "[Activate: Main] You may trash this Character: Reveal 1 card from the top of your Life cards. If that card is a [Monkey.D.Luffy] with a cost of 5, you may play that card. If you do, up to 1 of your Leader gains +2000 power until the end of your opponent's next turn.",
    '[Activate: Main] [Once Per Turn] This Character gains +2000 power until the start of your next turn. Then, if you have 1 or more Life cards, draw 1 card and trash 1 card from the top of your Life cards.',
    '[Rush] (This card can attack on the turn in which it is played.)[On Play] Look at all your Life cards; place 1 at the top of your deck and place the rest back in your Life area in any order.'
  ].freeze

  TRIGGER = [
    ''
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST13')
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      skip('Structure/Expansion set not yet available') unless expansion_set_enabled?('ST13')
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
