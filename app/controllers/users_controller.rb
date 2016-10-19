class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @from_time = Time.now
  end
end
