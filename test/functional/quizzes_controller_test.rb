require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase

  def log_in_regular_user
    user = FactoryGirl.create :user
    session[:user_id] = user.id
  end

  test "should not let anonymous users get index" do
    assert_raise(CanCan::AccessDenied) do
      get :index
    end
  end

  test "should get index" do
    log_in_regular_user
    get :index
    assert_response :success
  end

end
