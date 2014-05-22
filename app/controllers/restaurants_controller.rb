class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
            @review = Review.new
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name, :address, :cuisine))
	    if @restaurant.save
	      redirect_to '/restaurants'
      else
    	  render 'new'
      end	
	end

# this method shows us the form so we can make the edit
  def edit
  	@restaurant = Restaurant.find(params[:id])	
  end

# this method saves the change to the database
  def update
  	# as above with edit I want to yank from the database the record that I want to update - the first line of code below does this
  	@restaurant = Restaurant.find(params[:id])	
		if @restaurant.update(params[:restaurant].permit(:name, :address, :cuisine))
     redirect_to '/restaurants'
	  else
      render 'edit'  
	  end 
	end

  def destroy
 	  @restaurant = Restaurant.find(params[:id])	
 	  @restaurant.destroy
 	  flash[:notice] = 'Deleted successfully'
 	  redirect_to '/restaurants'
  end

end
