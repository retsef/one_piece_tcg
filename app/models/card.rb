# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  code       :string
#  colors     :text
#  cost       :integer          default(0)
#  counter    :integer          default(0)
#  effect     :text
#  elements   :text
#  name       :string
#  power      :integer          default(0)
#  rarity     :string
#  trigger    :text
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Card < ApplicationRecord
  include Searchable, Codeable, Colored, Attributed
  include Friendly

  friendly_id :code

  has_many :card_families, class_name: 'Card::Family', dependent: :destroy
  has_many :families, through: :card_families, class_name: '::Family'

  has_many :artworks, class_name: 'Card::Artwork', dependent: :destroy

  enum :rarity, {
    leader: 'L',
    common: 'C',
    uncommon: 'UC',
    rare: 'R',
    super_rare: 'SR',
    secret_rare: 'SEC',
    promo: 'P'
  }, scopes: false

  scope :leader, -> { where(type: 'Leader') }
  scope :not_leader, -> { where.not(type: 'Leader') }
  scope :character, -> { where(type: 'Character') }
  scope :event, -> { where(type: 'Event') }
  scope :stage, -> { where(type: 'Stage') }

  scope :with_trigger, -> { where.not(trigger: [ nil, '' ]) }
  scope :with_effect, -> { where.not(effect: [ nil, '' ]) }

  # has_one_attached :front
  # has_one_attached :back

  validates :name, :rarity, :colors, :attributes, presence: true

  # TODO: maybe download the images from the official website to optimize the load
  def image_url
    "https://en.onepiece-cardgame.com/images/cardlist/card/#{code}.png"
  end

  def effect_graph
    Card::Effect.parse(effect)
  end

  searchable_by :name, :code, :rarity
  searchable_along :families
end
