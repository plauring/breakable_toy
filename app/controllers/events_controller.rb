class EventsController < ApplicationController
  before_action :authorize_user

  def index
    @events = Event.all
    if user_signed_in?
      @user = current_user
    end
    @favorite_teams = @user.teams
  end

  def show
    @event = Event.find(params[:id])
    @memberships = @event.memberships
    @membership = Membership.new
    @user = current_user
  end

  def new
    if !user_signed_in?
      flash[:notice] = 'Sign in or Sign up to create an event'
      redirect_to root_path
    else
      @event = Event.new
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event added successfully"
      redirect_to event_path(@event.id)
    else
      flash[:notice] = @event.errors.full_messages.join(", ")
      render 'new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :address, :city, :state, :zip, :game_id)
  end

  def authorize_user
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
