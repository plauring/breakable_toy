class FavoritesController < ApplicationController
  before_action :authorize_user

  def index
    @favorites = Favorite.all
  end

  def new
    @user = current_user
    @teams = Team.all
    @favorite = Favorite.new
    @conference_collection = Conference::CONFERENCES
  end

  def create
    @user = current_user
    @favorites = @user.teams
    @favorite = Favorite.create(user_id: @user.id, team_id: params[:team_id])
    if @favorite.save
      render json: @favorites.to_json
    end
  end

  private

  def authorize_user
    unless user_signed_in?
      raise ActionController::RoutingError.new('Where ya goin?!@')
    end
  end
end
