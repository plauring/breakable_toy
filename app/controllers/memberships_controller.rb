class MembershipsController < ApplicationController
  before_action :authorize_user

  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
    if !user_signed_in?
      flash[:notice] = 'Sign In or Sign Up to join this event'
      redirect_to root_path
    else
      @event = Event.find(params[:event])
      @membership = Membership.new
      @user = current_user
    end
  end

  def create
    @user = current_user
    params[:user_id] = @user.id
    @event = Event.find(params[:event_id])
    @memberships = @event.memberships
    @memberships.each do |membership|
      if membership.user_id == @user.id
        flash[:notice] = 'You are already signed up for this event'
        redirect_to event_path(@event)
        return
      end
    end
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:notice] = 'You have succesfully joined the event'
      redirect_to event_path(@event)
    else
      flash[:notice] = @membership.errors.full_messages.join(', ')
      render 'events/show'
    end
  end

  private

  def membership_params
    params.permit(:user_id, :event_id)
  end

  def authorize_user
    unless user_signed_in?
      raise ActionController::RoutingError.new('Where ya goin?!@')
    end
  end
end
