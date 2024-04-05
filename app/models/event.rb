class Event < Card
  validates :power, presence: true, numericality: true
end
