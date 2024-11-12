class Arena::HandComponentPreview < ViewComponent::Preview
  # @param hand_size number
  def default(hand_size: 5)
    cards = Card.first(hand_size)

    render Arena::Hand::Component.new do |hand|
      hand.with_cards(cards)
    end
  end
end
