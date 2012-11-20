class SiteController < ApplicationController
  def index
    @first_quiz = Quiz.featured.first
  end
end
