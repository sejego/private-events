class EventsController < ApplicationController

# check user
  before_action :authenticate_user!, except: [:home]
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit

  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: "Successfully created an event" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    end
  end

  def destroy
    if @event.present?
      @event.destroy
    end
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def home
  end
end
