class Leader < Card
  attribute :rarity, default: :leader

  alias_attribute :life, :cost
end
