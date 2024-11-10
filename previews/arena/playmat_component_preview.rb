class Arena::PlaymatComponentPreview < ViewComponent::Preview
  def default
    render Arena::Playmat::Component.new
  end
end
