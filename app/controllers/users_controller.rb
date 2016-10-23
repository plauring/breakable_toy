class UsersController < ApplicationController
  def index
  end

  def show
    @teams = Team.all
    @favorite = Favorite.new
    @user = User.find(params[:id])
    @favorites = @user.teams
    @conference_collection = Conference::CONFERENCES
  end
end
