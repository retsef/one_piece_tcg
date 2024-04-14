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
