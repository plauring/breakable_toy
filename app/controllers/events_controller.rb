class EventsController < ApplicationController
  before_action :authorize_user, except: [:index, :new]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
      flash[:notice] = 'Event added successfully'
      redirect_to event_path(@event.id)
    else
      flash[:notice] = @event.errors.full_messages.join(', ')
      render 'new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :address, :city, :state, :zip)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new('Where ya goin?!@')
    end
  end
end
