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
class Stage < Card
  validates :cost, presence: true, numericality: true
end
