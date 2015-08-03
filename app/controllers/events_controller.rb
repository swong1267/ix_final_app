class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    can_change_event @event
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
    can_change_event @event
    @event.destroy
    redirect_to events_path
  end

  private

    def event_params
      params.require(:event).permit(:name, :location, :people, :category, :description, :public)
    end

    def can_change_event event
      if event.user != current_user
        flash[:error] = "Insufficient permissions"
        redirect_to events_path
      end
    end
end

