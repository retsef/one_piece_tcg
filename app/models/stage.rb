class Stage < Card
  validates :cost, presence: true, numericality: true
end
