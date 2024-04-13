class Admin::Notification::AlertComponentPreview < ViewComponent::Preview
  # @param title text
  # @param description text
  # @param confirm text
  def default(title: "Example component default",
              description: "This is an example of a default alert component.",
              confirm: "OK")
    render Admin::Notification::Alert::Component.new(
      title:,
      description:,
      confirm:
    )
  end
end
