class Admin::Notification::InlineAlertComponentPreview < ViewComponent::Preview
  # @param title text
  # @param kind select { choices: [info, success, notice, warning, error] }
  def default(kind: :info, title: "This is an example of a default inline alert component.")
    render Admin::Notification::InlineAlert::Component.new(
      kind, title
    )
  end
end
