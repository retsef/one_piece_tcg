require 'test_helper'

class Admin::Notification::AlertComponentTest < ViewComponent::TestCase
  def test_render_preview
    render_preview(:default, params: { title: 'This is an alert' })

    assert_text 'This is an alert'
  end
end
