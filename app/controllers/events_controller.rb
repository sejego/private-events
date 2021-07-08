class EventsController < ApplicationController

# check user
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Successfully created an event" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :location)
  end
end
