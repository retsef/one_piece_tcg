class Character < Card
  validates :power, :cost, :counter, presence: true, numericality: true
end
