class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @user = current_user
    @favorite_team = FavoriteTeams.new
  end
end
