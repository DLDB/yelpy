class ReviewsController < ApplicationController
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
 		@restaurant.reviews.create!(params[:review].permit(:thoughts, :rating))
 		redirect_to '/restaurants'
  end

end
