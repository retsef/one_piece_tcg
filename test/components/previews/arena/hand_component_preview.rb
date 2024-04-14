class Arena::HandComponentPreview < ViewComponent::Preview
  def default
    render Arena::Hand::Component.new do |hand|
      hand.with_card(label: 'Card 1')
      hand.with_card(label: 'Card 2')
      hand.with_card(label: 'Card 3')
      hand.with_card(label: 'Card 4')
      hand.with_card(label: 'Card 5')
    end
  end
end
