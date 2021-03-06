require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get root_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { firstname: "",
                      lastname: "", email: "user@invalid",
                      password: "foo",
                      password_confirmation: "barbar" } }
    end
    assert_template 'static_pages/home'
    assert_select 'div.invalid-feedback', count: 5
  end

  test "valid signup information with account activation" do
    get root_path
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { firstname: "Example",
                    lastname: "User", email: "user@example.com",
                    password: "password123",
                    password_confirmation: "password123" } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation.
    log_in_as(user)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: "wrong")
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
