class Card < ApplicationRecord
  include Searchable, Codeable, Colored, Attributed

  has_many :card_families, class_name: 'Card::Family', dependent: :destroy
  has_many :families, through: :card_families

  enum :rarity, {
    leader: 'L',
    common: 'C',
    uncommon: 'UC',
    rare: 'R',
    super_rare: 'SR',
    secret_rare: 'SEC',
    promo: 'P'
  }

  has_one_attached :front
  has_one_attached :back

  validates :name, :colors, :attributes, presence: true

  def image_url
    "https://en.onepiece-cardgame.com/images/cardlist/card/#{code}.png"
  end

  def effect_graph
    Card::Effect.parse(effect)
  end
end
