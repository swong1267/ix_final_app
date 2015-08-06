class RequestsController < ApplicationController
  before_action :verify_user_owns_event, :only => [:create]

  def index
    @received_requests = current_user.space_requests
    @sent_requests  = current_user.event_requests
  end

  def new
    @request = Request.new
    @events = current_user.events
    @space = Space.find(params[:space_id])
  end

  def create
    @space = Space.find(params[:space_id])

    @request = Request.new(request_params)
    @request.event = @event
    @request.space = @space

    if @request.save
      # redirect_to space_path(@request.space)
      redirect_to requests_path
    else
      render 'new'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end

  def confirm
    @request = Request.find(params[:id])
    @request.confirmed!
    @event = @request.event
    @space = @request.space
    @event.space = @space
    @event.save
    redirect_to event_path(@event)
  end

  def deny
    @request = Request.find(params[:id])
    @request.denied!
    redirect_to requests_path
  end

  private

  def verify_user_owns_event
    @event = current_user.events.find_by_id(params[:request][:event_id])

    if @event.blank?
      redirect_to space_path(params[:space_id]), alert: "That's not your event!"
    end
  end

  def request_params
    params.require(:request).permit(:body)
  end
end