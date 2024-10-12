# == Schema Information
#
# Table name: card_families
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  card_id    :integer          not null
#  family_id  :integer          not null
#
# Indexes
#
#  index_card_families_on_card_id    (card_id)
#  index_card_families_on_family_id  (family_id)
#
# Foreign Keys
#
#  card_id    (card_id => cards.id)
#  family_id  (family_id => families.id)
#
class Card::Family < ApplicationRecord
  belongs_to :card
  belongs_to :family

  validates :family, uniqueness: { scope: :card_id }
end
