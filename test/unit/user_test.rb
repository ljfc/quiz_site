require 'test_helper'

class UserUnitTest < ActiveSupport::TestCase
  
  # Sanity check: make sure our stubbed model is valid.
  def test_factory_saves
    user = FactoryGirl.build_stubbed(:user)
    assert user.valid?, "Default FactoryGirl stubbed user is valid"
  end

  # Make sure responses are assigned to the new user.
  def test_take_over_session
    user = FactoryGirl.build_stubbed(:user)
    response = mock 'response'
    responses = [response]
    response.expects(:user=).with(user).returns(nil)
    response.expects(:save).returns(true)
    response.stubs(:valid?).returns(true)
    Response.stubs(:for_session).returns(responses)

    user.take_over_session('123')
  end

end
