module ReviewsHelper

	def star_rating(number)
		return number if number == 'N/A'
	  number = number.round
	  filled_stars = '★' * number 
    empty_stars = '☆' * (5 - number)
		filled_stars + empty_stars
	end

end
