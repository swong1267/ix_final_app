class InquiriesController < ApplicationController
  def index
    @inquiries = Inquiry.all
  end

  def new
    @inquiry = Inquiry.new
    @events = Event.all.map do |event|
      event.name
    end
    @space = Space.find(params[:space_id])
  end

  def create
    @space = Space.find(params[:space_id])
    @event = Event.find_by(name: params[:inquiry][:event])
    @inquiry = Inquiry.create event: @event, body: inquiry_params[:body], space: @space

    if @event.user != current_user
      flash[:error] = "That's not your event!"
      redirect_to space_path(@space)
    elsif @inquiry.save
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

  def inquiry_params
    params.require(:inquiry).permit(:body)
  end
end