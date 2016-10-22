class FavoriteTeamsController < ApplicationController
  before_action :authorize_user

  def index
    @favorite_teams = FavoriteTeams.all
  end

  def new
    @user = current_user
    @teams = Team.all
    @this = FavoriteTeams.new
  end

  def create
    # binding.pry
    @user = current_user
    FavoriteTeams.create(user_id: @user.id, team_id: params[:team_id])
  end

  private

  # def favorite_teams_params
  #   params.require(:favorite_teams).permit(:user_id, :team_id)
  # end

  def authorize_user
    unless user_signed_in?
      raise ActionController::RoutingError.new('Where ya goin?!@')
    end
  end
end
