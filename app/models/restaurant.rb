class Restaurant < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { scope: :address, message: "already exists at this location" }
	validates :address, presence: true, length: { minimum: 3 }
	validates :cuisine, presence: true

	has_many :reviews

	# below is an alternative to has_many :reviews
	  # def reviews
  #   Review.where(restaurant_id: self.id)
  # end




  def average_rating
  	if reviews.any?
  		reviews.average(:rating)		

  	  # alternatively the alternativelybove Rails method [.average] could be written using inject: 	
  		# total = reviews.inject(0) do |total, review| 
  		# 	total + review.rating 
  		# end
  		# total / reviews.count.to_f
    else
    	'N/A'
    end
  end


end

