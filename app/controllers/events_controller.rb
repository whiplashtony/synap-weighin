class EventsController < ApplicationController
  def index
    @events = Event.all.order('created_at DESC')
  end

  def show
    @event = Event.find(params[:id])
    # add league views in leader board

  end

  def create
    @event = Event.create(event_params)
    redirect_to people_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :tagline)
  end
end
