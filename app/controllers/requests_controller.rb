class RequestsController < ApplicationController

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
    @request.event = Event.find(params[:request][:event_id])
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

    send_confirmed_message @event
    redirect_to event_path(@event)
  end

  def deny
    @request = Request.find(params[:id])
    @request.denied!
    send_denied_message @request
    redirect_to requests_path
  end

  private

  def send_confirmed_message(event)
    subject = "You're event " + event.name + " has been confirmed!"
    body = event.space.user.email + " has accepted your request! "
    Message.create! recipient: event.user, subject: subject, body: body
  end

  def send_denied_message(request)
    subject = "You're event " + request.event.name + " has been denied."
    body = request.space.user.email + " has denied your request! "
    Message.create! recipient: request.event.user, subject: subject, body: body
  end

  def request_params
    params.require(:request).permit(:body)
  end
end