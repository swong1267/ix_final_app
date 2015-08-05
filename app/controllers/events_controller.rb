class EventsController < ApplicationController
  def index
    @events = current_user.events
    @events << Event.where(public: true)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    can_change_object? @event
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    can_change_object? @event
    @event.destroy
    redirect_to events_path
  end

  def new_request
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :people, :category, :avatar, :description, :public)
    end
end

