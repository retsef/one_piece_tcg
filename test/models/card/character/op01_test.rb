require "test_helper"

class Card::Character::OP01Test < ActiveSupport::TestCase
  EFFECT = [
    "[On Play] Look at 5 cards from the top of your deck; reveal up to 1 {Straw Hat Crew} type card other than [Nami] and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[Rush] (This card can attack on the turn in which it is played.)",
    "[DON!! x1] [Your Turn] [Once Per Turn] Draw 1 card when your opponent activates an Event.",
    "[On Play] Add up to 1 red Character card other than [Uta] with a cost of 3 or less from your trash to your hand.",
    "[On Play] Give up to 1 of your opponent's Characters −2000 power during this turn.",
    "[On K.O.] K.O. up to 1 of your opponent's Characters with 4000 power or less.",
    "[On Play] You may add 1 card from your Life area to your hand: This Character gains [Rush] during this turn. (This card can attack on the turn in which it is played.)",
    # "[Trigger] Play this card.", # FIXME: OP01-009 Carrot
    "-",
    "[On Play] You may place 1 card from your hand at the bottom of your deck: Draw 1 card.",
    "[Activate: Main] [Once Per Turn] You may add 1 card from your Life area to your hand: This Character gains +2000 power during this turn. Then, give this Character up to 2 rested DON!! cards.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x1] [On Block] Play up to 1 red Character card with a cost of 2 or less from your hand.",
    "[DON!! x1] [When Attacking] You may trash 1 card from your hand: Add up to 1 {Straw Hat Crew} type Character card other than [Tony Tony.Chopper] with a cost of 4 or less from your trash to your hand.",
    "[DON!! x1] [When Attacking] K.O. up to 1 of your opponent's Characters with 3000 power or less.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x2] [Opponent's Turn] This Character gains +3000 power.",
    "[Activate: Main] You may rest this Character: Up to 1 of your Leader or Character cards gains +2000 power during this turn.",
    "[DON!! x1] This Character can also attack your opponent's active Characters.",
    "[DON!! x1] [When Attacking] Give up to 2 of your opponent's Characters −2000 power during this turn.",
    "[DON!! x2] This Character cannot be K.O.'d in battle by ＜Strike＞ attribute Characters.[Activate: Main] [Once Per Turn] Give this Character up to 2 rested DON!! cards.",
    "[DON!! x1] If your opponent has 2 or more rested Characters, this Character gains +2000 power.",
    "[On Play] Rest up to 1 of your opponent's Characters with a cost of 4 or less.",
    "[DON!! x2] [When Attacking] Set up to 1 of your DON!! cards as active.",
    "[DON!! x1] [When Attacking] [Once Per Turn] Rest up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[DON!! x1] [When Attacking] K.O. up to 1 of your opponent's rested Characters with a cost of 2 or less.[On K.O.] Your opponent chooses 1 card from your hand; trash that card.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x1] [On Block] If you have 3 or more Characters, draw 1 card.",
    "[On Play] If your Leader is [Kouzuki Oden], play up to 1 {The Akazaya Nine} type Character card with a cost of 3 or less from your hand.[DON!! x1] [When Attacking] [Once Per Turn] Set up to 1 of your {The Akazaya Nine} type Character cards with a cost of 3 or less as active.",
    "[Activate: Main] ➀ (You may rest the specified number of DON!! cards in your cost area) You may rest this Character: Look at 5 cards from the top of your deck; reveal up to 1 {Land of Wano} type card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] ③ (You may rest the specified number of DON!! cards in your cost area.): If your Leader is [Kouzuki Oden], set up to 1 of your {Land of Wano} type Character cards with a cost of 3 or less as active.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If you don't have [Penguin], play up to 1 [Penguin] from your hand.",
    "[DON!! x1] [When Attacking] If your Leader is [Kouzuki Oden], set up to 2 of your DON!! cards as active.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] You may return 1 Character to your hand: Play up to 1 Character card with a cost of 3 or less from your hand.",
    "[On Play] Rest up to 1 of your opponent's Characters with a cost of 3 or less.",
    "[DON!! x1] [When Attacking] Play up to 1 {Heart Pirates} type Character card other than [Bepo] with a cost of 4 or less from your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] If you don't have [Shachi], play up to 1 [Shachi] from your hand.",
    "[DON!! x1] [Opponent's Turn] If this Character is rested, your opponent cannot attack any card other than the Character [Eustass\"Captain\"Kid].[Activate: Main] [Once Per Turn] You may rest this Character: Play up to 1 Character card with a cost of 3 or less from your hand.",
    "[When Attacking] [Once Per Turn] If you have 2 or more rested Characters, draw 1 card.",
    "[On Play] K.O. up to 1 of your opponent's rested Characters with a cost of 4 or less.",
    "[DON!! x1] [Activate: Main] You may rest this Character: Choose 1 card from your opponent's hand; your opponent reveals that card. If the revealed card is an Event, place up to 1 card from your opponent's Life area at the bottom of the owner's deck.",
    "[DON!! x1] [When Attacking] You may trash 1 card from your hand: Return up to 1 of your opponent's Characters with a cost of 3 or less to the owner's hand.",
    "[Banish] (When this card deals damage, the target card is trashed without activating its Trigger.)[DON!! x1] Give blue Events in your hand −1 cost.",
    "[Your Turn] This Character gains [Double Attack] if you have 5 or more cards in your hand.(This card deals 2 damage.)",
    "[On K.O.] Play up to 1 [Smiley] from your deck, then shuffle your deck.",
    "[On Play] Place up to 1 Character with a cost of 7 or less at the bottom of the owner's deck.",
    "[On Play] Place up to 1 Character with a cost of 3 or less at the bottom of the owner's deck.",
    "[DON!! x1] [Your Turn] This Character gains +1000 power for every card in your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Play] Look at 5 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] Play up to 1 [Pacifista] with a cost of 4 or less from your hand.",
    "Under the rules of this game, you may have any number of this card in your deck.[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[On Play] Look at 5 cards from the top of your deck and place them at the top or bottom of the deck in any order.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[DON!! x1] [When Attacking]/[On Block] Draw 1 card if you have 5 or less cards in your hand.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On K.O.] If your Leader has the {Baroque Works} type, add up to 1 Event from your trash to your hand.",
    "[On K.O.] Draw 1 card.",
    "[DON!! x1] [Your Turn] If your Leader has the {Baroque Works} type, this Character gains +1000 power for every 2 Events in your trash.",
    "[DON!! x1] [When Attacking] Look at 5 cards from the top of your deck; reveal up to 1 {Baroque Works} type Event card and add it to your hand. Then, place the rest at the bottom of your deck in any order.",
    "[On Play] If your Leader has the {Baroque Works} type, select up to 1 of your opponent's Characters with a cost of 4 or less. The selected Character cannot attack until the end of your opponent's next turn.",
    "[On Play] ① (You may rest the specified number of DON!! cards in your cost area.): Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] DON!! −6 (You may return the specified number of DON!! cards from your field to your DON!! deck.): If your Leader has the {Animal Kingdom Pirates} type, K.O. all Characters other than this Character.",
    "[On Play] Draw 1 card if you have 8 or more DON!! cards on your field.",
    "[On Play] DON!! −2 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 3 or less and up to 1 of your opponent's Characters with a cost of 2 or less.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains [Rush] during this turn. Then, give up to 1 of your opponent's Characters −2000 power during this turn.(This card can attack on the turn in which it is played.)",
    "[On Play] Reveal up to 1 [Artificial Devil Fruit SMILE] from your deck and add it to your hand. Then, shuffle your deck.",
    "{Kurozumi Clan} type Characters other than your [Kurozumi Semimaru] cannot be K.O.'d in battle.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)",
    "[DON!! x1] [When Attacking] You may trash 1 card from your hand: Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[When Attacking] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Your opponent trashes 1 card from their hand.",
    "[On Play] Choose 2 cards from your opponent's hand; your opponent reveals those cards.",
    "[On Play] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On K.O.] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): K.O. up to 1 of your opponent's Characters with a cost of 5 or less.",
    "[DON!! x1] [Your Turn] If you have 8 or more DON!! cards on your field, this Character gains +1000 power.",
    "[Blocker] (After your opponent declares an attack, you may rest this card to make it the new target of the attack.)[On Block] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character gains +1000 power during this turn.",
    "[Activate: Main] [Once Per Turn] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): This Character can also attack your opponent's active Characters during this turn.",
    "[On K.O.] Add up to 1 DON!! card from your DON!! deck and rest it.",
    "[On Play] DON!! −1 (You may return the specified number of DON!! cards from your field to your DON!! deck.): Your opponent trashes 1 card from their hand.",
    "[Rush] (This card can attack on the turn in which it is played.)[When Attacking] Your opponent cannot activate a [Blocker] Character that has 2000 or less power during this battle.",
    "Also treat this card's name as [Kouzuki Oden] according to the rules.[Double Attack] (This card deals 2 damage.)[Banish] (When this card deals damage, the target card is trashed without activating its Trigger.)"
  ].freeze

  TRIGGER = [
    "",
    "Play this card."
  ].freeze

  EFFECT.each do |effect|
    test "parse effect: #{effect}" do
      parsed = Card::Character::Effect.parse(effect)

      assert_not_nil parsed
    end
  end

  TRIGGER.each do |trigger|
    test "parse trigger: #{trigger}" do
      parsed = Card::Character::Trigger.parse(trigger)

      assert_not_nil parsed
    end
  end
end
