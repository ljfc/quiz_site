require 'test_helper'

class ResponsesControllerTest < ActionController::TestCase
  setup do
    # Cannot use @response, because this is already an instance variable in a controller.
    @quiz_response = FactoryGirl.create :response
    # Do not test abilities - they will be tested elsewhere.
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @ability.stubs(:can?).returns(true)
    @controller.stubs(:current_ability).returns(@ability)
  end

  test "should get index" do
    get :index, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id
    assert_response :success
    assert_not_nil assigns(:responses)
  end

  test "should get new" do
    get :new, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id
    assert_response :success
  end

  test "should create response" do
    assert_difference('Response.count') do
      post :create, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id, response: { answer_id: @quiz_response.answer.id }
    end

    assert_response(:redirect) # Where exactly can vary.
  end

  test "should show response" do
    get :show, id: @quiz_response, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id
    assert_response :success
  end

  test "should not get edit" do
    assert_raise(RuntimeError) do
      get :edit, id: @quiz_response, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id
    end
  end

  test "should not update response" do
    assert_raise(RuntimeError) do
      put :update, id: @quiz_response, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id, response: { answer_id: @quiz_response.answer.id }
    end
  end

  test "should not destroy response" do
    assert_raise(RuntimeError) do
      delete :destroy, id: @quiz_response, quiz_id: @quiz_response.quiz.id, question_id: @quiz_response.question.id
    end
  end
end
