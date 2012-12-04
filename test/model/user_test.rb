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

  # Check the top-scoring users are found.
  def test_top_scorers
    correct_answer_1 = FactoryGirl.create :possible_answer, correct: true
    correct_answer_2 = FactoryGirl.create :possible_answer, correct: true, question: correct_answer_1.question
    incorrect_answer = FactoryGirl.create :possible_answer, correct: false, question: correct_answer_1.question
    
    user_1 = FactoryGirl.create :user, email: '1@example.com'
    user_2 = FactoryGirl.create :user, email: '2@example.com'
    user_3 = FactoryGirl.create :user, email: '3@example.com'
    user_4 = FactoryGirl.create :user, email: '4@example.com'
    user_5 = FactoryGirl.create :user, email: '5@example.com'

    # User 1 has one incorrect answer.
    FactoryGirl.create :response, user: user_1, answer: incorrect_answer
    # User 2 has one correct answer.
    FactoryGirl.create :response, user: user_2, answer: correct_answer_1
    # User 3 has two correct answers.
    FactoryGirl.create :response, user: user_3, answer: correct_answer_1
    FactoryGirl.create :response, user: user_3, answer: correct_answer_2
    # User 4 has no answers.
    # User 5 has one correct answer and one incorrect answer.
    FactoryGirl.create :response, user: user_5, answer: correct_answer_2
    FactoryGirl.create :response, user: user_5, answer: incorrect_answer

    top_users = User.top_scorers(3)
    assert_equal user_3, top_users[0]
    assert_equal user_2, top_users[1]
    assert_equal user_5, top_users[2]
  end
end
