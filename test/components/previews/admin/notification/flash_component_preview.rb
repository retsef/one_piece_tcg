class Admin::Notification::FlashComponentPreview < ViewComponent::Preview
  # @param title text
  # @param kind select { choices: [info, success, notice, warning, error] }
  def default(kind: :info, title: "This is an example of a default flash component.")
    render Admin::Notification::Flash::Component.new(
      kind, title
    )
  end
end
