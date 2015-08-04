class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @events = @space.events.all
    @events_by_date = @events.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @review = Review.new
  end

  def new
    @space = Space.new
  end

  def edit
    @space = Space.find(params[:id])
    # can_change_space @space
    can_change_object? @space
  end

  def create
    @space = current_user.spaces.build(space_params)
    @space.date = Date.today

    if @space.save
      redirect_to space_path(@space)
    else
      render 'new'
    end
  end

  def update
    @space = Space.find(params[:id])
    if @space.update(space_params)
      redirect_to space_path(@space)
    else
      render 'edit'
    end
  end

  def destroy
    @space = Space.find(params[:id])
    can_change_object? @space
    @space.destroy
    redirect_to spaces_path
  end

  def add_event_to_space
    @spaces = current_user.spaces
    @events = Event.all
  end

  def link_event_to_space
    @spaces = current_user.spaces
    @events = Event.all
  end

  private

  def space_params
    params.require(:space).permit(:name, :category, :description, :location, :price, :capacity)
  end
end
