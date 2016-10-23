class MembershipsController < ApplicationController

  def new

    @membership = Membership.new
    if !user_signed_in?
      flash[:notice] = 'Sign In or Sign Up to join this event'
      redirect_to root_path
    else
      @event = Event.find(params[:event_id])
      @membership = Membership.new
      @user = current_user
    end
  end

  def create
    binding.pry
    @event = Event.find(params[:event_id])
    @user = current_user
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:notice] = 'You have succesfull joined #{@event.name}'
      redirect_to event_path(@event)
    else
      flash[:notice] = @meetup.errors.full_messages.join(', ')
      render event_path(@event)
    end


  end

  private

  def membership_params
    params.require(:membership).permit(:user, :meetup)

  end
end

<%= form_for [@user, @favorite] do |f| %>
  <div class="row">
      <%= f.label "ACC" %>
      <%= f.select :team_id, options_for_select(@acc) %>
  </div>

  <div class="actions">
    <%= f.submit "Add Favorites" %>
  </div>
<% end %>
