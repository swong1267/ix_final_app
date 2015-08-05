class InquiriesController < ApplicationController
  before_action :verify_user, :only => [:create]

  def index
    @sent_inquiries = current_user.inquiries
    @inquiries = Inquiry.all
    # @received_inquiries = 
  end

  def new
    @inquiry = Inquiry.new
    @events = Event.all
    @space = Space.find(params[:space_id])
  end

  def create
    @space = Space.find(params[:space_id])
    @event = Event.find(params[:inquiry][:event_id])
    @inquiry = Inquiry.create(inquiry_params)
    @inquiry.event = @event
    @inquiry.space = @space

    if @inquiry.save
      redirect_to space_path(@inquiry.space)
    else
      render 'new'
    end
  end

  def destroy
    @inquiry = inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to inquiries_path
  end

  private

  def verify_user
    event = Event.find(params[:inquiry][:event_id])
    space = Space.find(params[:space_id])
    unless event.user == current_user
      flash[:error] = "That's not your event!"
      redirect_to space_path(space)
    end
  end

  def inquiry_params
    params.require(:inquiry).permit(:body)
  end
end