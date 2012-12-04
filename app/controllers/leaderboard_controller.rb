class LeaderboardController < ApplicationController

  def index
    @users = User.top_scorers(10)
  end

end
