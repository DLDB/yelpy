class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		Restaurant.create(params["restaurant"].permit(:name, :address))
	  redirect_to '/restaurants'
	end

# this method shows us the form so we can make the edit
  def edit
  	@restaurant = Restaurant.find(params[:id])	

  end

# this method saves the change to the database
  def update
  	# as above with edit I want to yank from the database the record that I want to update - the first line of code below does this
  	@restaurant = Restaurant.find(params[:id])	
		@restaurant.update(params[:restaurant].permit(:name, :address))
	  redirect_to '/restaurants'
	end

  def destroy
 	  @restaurant = Restaurant.find(params[:id])	
 	  @restaurant.destroy
 	  flash[:notice] = 'Deleted successfully'
 	  redirect_to '/restaurants'
  end

end