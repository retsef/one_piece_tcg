class Family < ApplicationRecord
  include Searchable

  has_many :card_families, class_name: 'Card::Family', dependent: :destroy

  with_options through: :card_families, source: :card do
    has_many :cards, class_name: 'Card'
    has_many :leaders, class_name: 'Leader'
  end

  validates :name, presence: true, uniqueness: true

  searchable_by :name
end
