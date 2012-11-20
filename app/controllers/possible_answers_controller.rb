class PossibleAnswersController < ApplicationController
  load_and_authorize_resource :quiz
  load_and_authorize_resource :question, through: :quiz
  load_and_authorize_resource through: :question
  respond_to :html, :js

  def new
    respond_with @possible_answer
  end
  def create
    flash[:notice] = I18n.t('possible_answers.create.notice') if @possible_answer.save
    respond_with @possible_answer
  end


  def index
    respond_with @possible_answers
  end

  def show
    respond_with @possible_answer
  end

  def edit
    respond_with @possible_answer
  end
  def update
    flash[:notice] = I18n.t('possible_answers.update.notice') if @possible_answer.update_attributes(params[:possible_answer])
    respond_with @possible_answer
  end

  def destroy
    flash[:notice] = I18n.t('possible_answers.destroy.notice') if @possible_answer.destroy
    respond_with @possible_answer
  end
end
