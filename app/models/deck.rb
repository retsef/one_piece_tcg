class Deck < ApplicationRecord
  has_many :card_decks, class_name: 'Card::Deck', dependent: :destroy

  with_options class_name: 'Card', through: :card_decks, source: :card do
    has_one :leader, -> { where(rarity: :leader) }
    has_many :cards, -> { where.not(rarity: :leader) }
  end

  def colors
    leader&.colors || []
  end

  def card_count
    card_decks.sum(:quantity)
  end
end
