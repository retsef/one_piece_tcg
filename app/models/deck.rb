# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  leader_id  :integer
#
# Indexes
#
#  index_decks_on_leader_id  (leader_id)
#
# Foreign Keys
#
#  leader_id  (leader_id => cards.id)
#
class Deck < ApplicationRecord
  has_many :card_decks, class_name: 'Card::Deck', dependent: :destroy

  belongs_to :leader, class_name: 'Leader', optional: true

  with_options source: :card, class_name: 'Card', through: :card_decks do
    has_many :cards, -> { not_leader }
  end

  validates :leader, presence: true, on: :battle

  def colors
    leader&.colors || []
  end

  def card_count
    card_decks.sum(:quantity)
  end
end
