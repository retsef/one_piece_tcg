require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def login_as(email, password)
    post login_path, params: { email: email, password: password }
  end

  def login(user)
    login_as user.email, 'secret'
  end
end
