class SpacesController < ApplicationController
  def index
    @spaces = Space.all

    @geojson = Array.new
    @spaces.each do |space|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [space.longitude, space.latitude]
        },
        properties: {
          name: space.name,
          address: space.location,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end

  end

  def show
    @space = Space.find(params[:id])
    @events = @space.events.all
    @events_by_date = @events.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @review = Review.new
    @avg_rating = 0.0
    binding.pry


    @geojson = Array.new
    @geojson << {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [@space.longitude, @space.latitude]
      },
      properties: {
        name: @space.name,
        address: @space.location,
        :'marker-color' => '#00607d',
        :'marker-symbol' => 'circle',
        :'marker-size' => 'medium'
      }
    }

    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end

  end

  def myspaces
  @spaces = Space.where(user_id: current_user.id).order(created_at: :desc)

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

  private

  def space_params
    params.require(:space).permit(:name, :category, :description, :location, :price, :capacity, :avatar)
  end

end
