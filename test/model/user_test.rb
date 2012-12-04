require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # Sanity check: make sure a valid record saves.
  def test_factory_saves
    user = FactoryGirl.create(:user)
    assert user.save, "Saved the default FactoryGirl user object"
  end

  # Make sure responses are assigned to the new user.
  def test_take_over_session
    session_id = '0123456789abcdef'
    user = FactoryGirl.create(:user)
    response = FactoryGirl.create(:response, user: nil, session_id: session_id)

    assert_nil Response.last.user
    user.take_over_session(session_id)
    assert_equal user, Response.last.user
  end

end
