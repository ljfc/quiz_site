require 'test_helper'

class ResponseUnitTest < ActiveSupport::TestCase

  # Sanity check: make sure our mock is valid.
  def test_factory_is_valid
    response = FactoryGirl.build_stubbed(:response)
    assert response.valid?, "Default FactoryGirl stubbed response is valid"
  end

  # A response must indicate which answer was chosen.
  def test_answer_must_be_present
    response = FactoryGirl.build_stubbed(:response, answer: nil)
    assert !response.valid?, "Response without an answer is not valid"
  end

  # A response must come from either a registered user or an anonymous sesssion.
  def test_user_or_session_id_must_be_present
    response = FactoryGirl.build_stubbed(:response, user: nil)
    assert !response.valid?, "Response with neither user nor session_id is not valid"
    response = FactoryGirl.build_stubbed(:response, user: nil, session_id: 'Session ID string')
    assert response.valid?, "Response with session_id but no user is valid"
  end

end
