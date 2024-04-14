class Arena::HandComponentPreview < ViewComponent::Preview
  def default
    cards = Card.first(5)

    render Arena::Hand::Component.new do |hand|
      hand.with_cards(cards)
    end
  end
end
