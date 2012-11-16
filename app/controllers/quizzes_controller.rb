class QuizzesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js

  def new
    @quiz.owner = current_user
    respond_with @quiz
  end
  def create
    flash[:notice] = I18n.t([:quizzes, :create, :notice]) if @quiz.save
    respond_with @quiz
  end


  def index
    respond_with @quizzes
  end

  def show
    respond_with @quiz
  end

  def edit
    respond_with @quiz
  end
  def update
    flash[:notice] = I18n.t([:quizzes, :update, :notice]) if @quiz.update_attributes(params[:quiz])
    respond_with @quiz
  end

  def destroy
    flash[:notice] = I18n.t([:quizzes, :destroy, :notice]) if @quiz.destroy
    respond_with @quiz
  end
end
