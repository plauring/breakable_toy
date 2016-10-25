class UsersController < ApplicationController
  
  def show
    @teams = Team.all
    @favorite = Favorite.new
    @user = User.find(params[:id])
    @favorites = @user.teams
    @conferences = Conference.all
    @conference_collection = Conference::CONFERENCES
  end
end
