class RequestsController < ApplicationController
  before_action :verify_user, :only => [:create]

  def index
    @received_requests = current_user.space_requests
    @sent_requests  = current_user.event_requests
  end

  def new
    @request = Request.new
    @events = Event.all
    @space = Space.find(params[:space_id])
  end

  def create
    @space = Space.find(params[:space_id])
    @event = Event.find(params[:request][:event_id])
    @request = Request.create(request_params)
    @request.event = @event
    @request.space = @space

    if @request.save
      redirect_to space_path(@request.space)
    else
      render 'new'
    end
  end

  def destroy
    @request = request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end

  private

  def verify_user
    event = Event.find(params[:request][:event_id])
    space = Space.find(params[:space_id])
    unless event.user == current_user
      flash[:error] = "That's not your event!"
      redirect_to space_path(space)
    end
  end

  def request_params
    params.require(:request).permit(:body)
  end
end