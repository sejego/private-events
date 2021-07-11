class AttendingsController < ApplicationController
before_action :authenticate_user!

  # POST /attendings
  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])

    # Only if there is already attendance, then skip and flash a message, otherwise create
    if @user.attending?(@event)
      flash[:alert] = 'You are already attending this event.'
      redirect_to event_path(@event)
    else
      @attending = Attending.new(attended_event_id: params[:event_id], attendee_id: params[:user_id])

      if @attending.save
        flash[:notice] = "You are now attending #{@event.name}"
        redirect_to event_path(@event)
      else
        flash[:alert] = "Failed to enroll you for #{@event.name}"
        redirect_to events_path
      end
    end
  end

  # DELETE /attendings/1 or /attendings/1.json
  def destroy
    @attending = Attending.find(params[:id])
    @event = Event.find(@attending.attended_event_id) # find event by its ID from attendings
    if @attending.destroy
      flash[:notice] = "You are no longer attending #{@event.name}"
      redirect_to event_path(@event)
    else
      flash[:alert] = "Failed to unenroll you"
      redirect_to events_path
    end
  end

  private

  def attending_params
    params.fetch(:attending, {})
  end
end
