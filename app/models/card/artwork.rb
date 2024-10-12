# == Schema Information
#
# Table name: card_artworks
#
#  id         :integer          not null, primary key
#  rarity     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  card_id    :integer          not null
#
# Indexes
#
#  index_card_artworks_on_card_id  (card_id)
#
# Foreign Keys
#
#  card_id  (card_id => cards.id)
#
class Card::Artwork < ApplicationRecord
  self.table_name = 'card_artworks'

  belongs_to :card, touch: true

  enum :rarity, {
    default: 'default',
    alternative: 'AA',
    treasure_rare: 'TR',
    special_rare: 'SR',
    manga_rare: 'MR'
  }

  attribute :rarity, :string, default: 'default'

  validates :rarity, presence: true # , uniqueness: { scope: :card_id }

  has_one_attached :image

  def attach_image(image_url)
    Card::ArtworkImageJob.perform_later(self, image_url)
  end
end
