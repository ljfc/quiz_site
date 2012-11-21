class ResponsesController < ApplicationController
  load_resource :quiz
  load_resource :question, through: :quiz
  load_and_authorize_resource # NOT through: :question, as the link is through the, perhaps unknown, possible_answer.
  respond_to :html, :js

  def new
    respond_with @response
  end
  def create
    @response.user = current_user if current_user
    @response.session_id = session[:session_id] # So we can group answers without a user.
    flash[:notice] = I18n.t('responses.create.notice') if @response.save
    if @question.next_question
      respond_with @response, location: new_quiz_question_response_path(@quiz, @question.next_question)
    else
      respond_with @response, location: root_path
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
end
