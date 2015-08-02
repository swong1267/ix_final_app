class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def edit
    @space = Space.find(params[:id])
  end

  def create
    @space = current_user.spaces.build(space_params)
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
    @space.destroy
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :category, :description, :location, :price, :capacity)
  end
end
