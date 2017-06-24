class EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    # @visitors = Visitor.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to "/events/#{@event.id}"
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    event = Event.find_by(id: params[:id])
    event.assign_attributes(name: params[:name], description: params[:description], start_time: params[:start_time], end_time: params[:end_time])
    event.save
    flash[:success] = "Event Updated"
    redirect_to "/events/#{event.id}"
    # if @event.save!
    #   redirect_to @event
    # else
    #   render '/events'
    # end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    flash[:success] = "Event deleted."
    redirect_to "/"
  end

private
  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time)
  end

  def test_params
    params.permit(:name, :description, :start_time, :end_time)
  end
end
