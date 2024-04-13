require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :safari, screen_size: [1280, 768]
  driven_by :selenium, using: :headless_chrome, screen_size: [1280, 768]
  # driven_by :selenium, using: :remote, options: { capabilities: :chrome }

  # include Sorcery::TestHelpers::Rails::Integration

  def login_as(email, password)
    visit login_path

    fill_in id: 'email', with: email
    fill_in id: 'password', with: password
    click_on id: 'login'
  end

  def login(user)
    login_as user.email, 'secret'
  end

  def logout
    Capybara.reset_sessions!
  end
end
