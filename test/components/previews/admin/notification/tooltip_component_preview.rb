class Admin::Notification::TooltipComponentPreview < ViewComponent::Preview
  # @param position select { choices: [top, bottom, right, left] }
  # @param text text
  def default(position: :top, text: "Tooltip")
    render Admin::Notification::Tooltip::Component.new(position:) do
      tag.span text
    end
  end
end
