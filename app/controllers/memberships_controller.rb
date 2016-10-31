class MembershipsController < ApplicationController
  before_action :authorize_user

  def create
    @user = current_user
    params[:user_id] = @user.id
    @event = Event.find(params[:event_id])
    @game = @event.game
    @memberships = @event.memberships
    @memberships.each do |membership|
      if membership.user_id == @user.id
        flash[:notice] = 'You are already signed up for this event'
        redirect_to game_event_path(@game, @event)
        return
      end
    end
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:notice] = 'You have succesfully joined the event'
      redirect_to game_event_path(@game, @event)
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
