class AttendingsController < ApplicationController
before_action :authenticate_user!

  # POST /attendings
  def create
    @event = Event.find(params[:event_id])

    # Only if there is already attendance, then skip and flash a message, otherwise create
    unless Attending.where('attendee_id': params[:user_id], 'attended_event_id': params[:event_id]).exists?
      @attending = Attending.new(attended_event_id: params[:event_id], attendee_id: params[:user_id])

      if @attending.save
        redirect_to event_path(@event)
      else
        redirect_to root_path
      end

    else
      flash[:alert] = 'You are already attending this event.'
      redirect_to event_path(@event)
    end
  end

  # DELETE /attendings/1 or /attendings/1.json
  def destroy

    # FINISH

  end

  private
    def attending_params
      params.fetch(:attending, {})
    end
end
