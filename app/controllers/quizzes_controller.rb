class QuizzesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js

  def new
    @quiz.owner = current_user
    respond_with @quiz
  end
  def create
    flash[:notice] = I18n.t('quizzes.create.notice') if @quiz.save
    respond_with @quiz
  end


  def index
    respond_with @quizzes
  end

  def show
    # We need to either show results or start the quiz, depending on if it's done.
    if @quiz.done?(current_user, request.session_options[:id])
      @responses = @quiz.responses_for_user_or_session(current_user, request.session_options[:id])
      respond_with @quiz
    else
      respond_with @quiz do |format|
        format.html { redirect_to new_quiz_question_response_path(@quiz, @quiz.questions.first) }
      end
    end
  end

  def edit
    respond_with @quiz
  end
  def update
    flash[:notice] = I18n.t('quizzes.update.notice') if @quiz.update_attributes(params[:quiz])
    respond_with @quiz
  end

  def destroy
    flash[:notice] = I18n.t('quizzes.destroy.notice') if @quiz.destroy
    respond_with @quiz
  end
end
