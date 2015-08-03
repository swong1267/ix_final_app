class ReviewsController < ApplicationController
  def create
    @space = Space.find(:space_id)
    @review = @space.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to space_path(@space)
    else
      render 'new'
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
