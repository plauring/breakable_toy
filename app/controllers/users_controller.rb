class UsersController < ApplicationController
  def index
  end

  def show
    @teams = Team.all
    @favorite = FavoriteTeams.new
    @user = User.find(params[:id])
    @from_time = Time.now
  end
end
