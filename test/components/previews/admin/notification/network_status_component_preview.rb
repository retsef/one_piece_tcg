class Admin::Notification::NetworkStatusComponentPreview < ViewComponent::Preview
  def default
    render Admin::Notification::NetworkStatus::Component.new
  end
end
