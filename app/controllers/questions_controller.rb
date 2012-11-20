class QuestionsController < ApplicationController
  load_and_authorize_resource :quiz
  load_and_authorize_resource through: :quiz
  respond_to :html, :js

  def new
    respond_with @question
  end
  def create
    flash[:notice] = I18n.t('questions.create.notice') if @question.save
    respond_with @question
  end


  def index
    respond_with @questions
  end

  def show
    respond_with @question
  end

  def edit
    respond_with @question
  end
  def update
    flash[:notice] = I18n.t('questions.update.notice') if @question.update_attributes(params[:question])
    respond_with @question
  end

  def destroy
    flash[:notice] = I18n.t('questions.destroy.notice') if @question.destroy
    respond_with @question
  end
end
