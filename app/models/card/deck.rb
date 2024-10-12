# == Schema Information
#
# Table name: card_decks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  card_id    :integer          not null
#  deck_id    :integer          not null
#
# Indexes
#
#  index_card_decks_on_card_id  (card_id)
#  index_card_decks_on_deck_id  (deck_id)
#
# Foreign Keys
#
#  card_id  (card_id => cards.id)
#  deck_id  (deck_id => decks.id)
#
class Card::Deck < ApplicationRecord
  belongs_to :card
  belongs_to :deck

  # validates :card, uniqueness: { scope: :deck_id }
  # validates :quantity, presence: true, numericality: { greater_than: 0 }
end
