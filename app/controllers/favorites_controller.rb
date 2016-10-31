class FavoritesController < ApplicationController
  before_action :authorize_user

  def create
    @user = current_user
    @favorites = @user.teams
    @favorite = Favorite.create(user_id: @user.id, team_id: params[:team_id])
    @new_fav_team = @favorite.team
    if @favorite.save
      render json: @new_fav_team.to_json
    end
  end

  private

  def authorize_user
    unless user_signed_in?
      raise ActionController::RoutingError.new('Where ya goin?!@')
    end
  end
end
