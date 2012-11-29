class ResponsesController < ApplicationController
  load_resource :quiz
  load_resource :question, through: :quiz
  load_and_authorize_resource # NOT through: :question, as the link is through the, perhaps unknown, possible_answer.
  respond_to :html, :js

  before_filter :set_user_and_session, only: [:new, :create]

  def new
    # The user is not allowed to respond any more if they have already done so.
    if @quiz.done?(@response.user, @response.session_id)
      respond_with @response do |format|
        format.html { redirect_to quiz_path(@quiz) }
      end
    else
      respond_with @response
    end
  end

  def create
    flash[:notice] = I18n.t('responses.create.notice') if @response.save
    if @question.next_question
      respond_with @response, location: new_quiz_question_response_path(@quiz, @question.next_question)
    else
      respond_with @response, location: quiz_path(@quiz) # This will show them the quiz results and tell them what to do next.
    end
  end


  def index
    respond_with @responses
  end

  def show
    respond_with @response
  end

  def edit
    respond_with @response
  end
  def update
    flash[:notice] = I18n.t('responses.update.notice') if @response.update_attributes(params[:response])
    respond_with @response
  end

  def destroy
    flash[:notice] = I18n.t('responses.destroy.notice') if @response.destroy
    respond_with @response
  end

private

  def set_user_and_session
    @response.user = current_user if current_user
    @response.session_id = request.session_options[:id] # So we can group answers without a user.
  end

end
