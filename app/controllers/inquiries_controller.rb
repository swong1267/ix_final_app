class InquiriesController < ApplicationController
  def index
    @inquiries = Inquiries.all
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @space = Space.find(params[:space_id])
    @event = Event.find_by(name: params[:event_name])
    @inquiry = @space.inquiries.build(inquiry_params)
    if @inquiry.save
      redirect_to space_path(@space)
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