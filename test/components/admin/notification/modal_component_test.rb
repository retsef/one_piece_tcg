require 'test_helper'

class Admin::Notification::ModalComponentTest < ViewComponent::TestCase
  def test_render_preview
    render_preview(:default, params: { title: "This is a modal" })

    assert_text "This is a modal"
  end
end
