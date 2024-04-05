class Card::Deck < ApplicationRecord
  belongs_to :card
  belongs_to :deck

  validates :card, uniqueness: { scope: :deck_id }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
