class Arena::CardComponentPreview < ViewComponent::Preview
  def default
    card = Card.second

    render Arena::Card::Component.new(card)
  end
end
