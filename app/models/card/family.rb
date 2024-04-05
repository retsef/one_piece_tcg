class Card::Family < ApplicationRecord
  belongs_to :card
  belongs_to :family

  validates :family, uniqueness: { scope: :card_id }
end
