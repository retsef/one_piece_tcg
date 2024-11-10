class Arena::CardComponentPreview < ViewComponent::Preview
  # @param series text
  # @param number text
  def default(series: 'OP01', number: '006')
    card = Card.find_by(code: "#{series}-#{number}")

    render Arena::Card::Component.new(card)
  end
end
