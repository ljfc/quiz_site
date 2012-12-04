require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  
  def test_user_can_sign_up
    # This uses the 'identity' strategy, i.e. a simple email and username.
    get signup_path
    assert_response :success, "Visit sign up page"
    user = FactoryGirl.attributes_for :user
    post 'auth/identity/register',
      name: user[:display_name],
      unique_identifier: user[:email],
      password: 'password',
      password_confirmation: 'password'
    assert_response :redirect
  end

  def test_user_can_sign_up_using_third_party
    # This uses the 'developer' strategy, so we are not testing a particular third party.
    get 'auth/developer'
    assert_response :success, "Visit 'developer' sign up page"
    user = FactoryGirl.attributes_for :user
    post 'auth/developer/callback',
      email: user[:email],
      full_name: user[:display_name],
      display_name: user[:display_name]
    assert_response :redirect
  end

end
