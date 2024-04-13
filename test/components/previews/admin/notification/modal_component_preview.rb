class Admin::Notification::ModalComponentPreview < ViewComponent::Preview
  # @param title text
  # @param body text
  # @param color select { choices: [slate, red, pink, blue, green, yellow, orange, purple, indigo, gray] }
  # @param commit text
  # @param cancel text
  def default(title: "Modal Title",
              body: "This is an example of a default modal component.",
              color: :slate,
              commit: "Save",
              cancel: "Cancel")
    render Admin::Notification::Modal::Component.new(
      modal_id: 'modal-1',
      title:,
      body:,
      color:,
      commit:,
      cancel:
    )
  end
end
