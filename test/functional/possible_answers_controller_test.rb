require 'test_helper'

class PossibleAnswersControllerTest < ActionController::TestCase
  setup do
    @possible_answer = possible_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:possible_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create possible_answer" do
    assert_difference('PossibleAnswer.count') do
      post :create, possible_answer: { correct: @possible_answer.correct, text: @possible_answer.text }
    end

    assert_redirected_to possible_answer_path(assigns(:possible_answer))
  end

  test "should show possible_answer" do
    get :show, id: @possible_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @possible_answer
    assert_response :success
  end

  test "should update possible_answer" do
    put :update, id: @possible_answer, possible_answer: { correct: @possible_answer.correct, text: @possible_answer.text }
    assert_redirected_to possible_answer_path(assigns(:possible_answer))
  end

  test "should destroy possible_answer" do
    assert_difference('PossibleAnswer.count', -1) do
      delete :destroy, id: @possible_answer
    end

    assert_redirected_to possible_answers_path
  end
end
