require 'spec_helper'

describe Review do
  it 'does not add a rating of greater than 5' do
    review = Review.new(rating: 6)
  	expect(review).to have(1).error_on(:rating) 
  end
 
	it 'does not add a rating of less than 1' do
	  review = Review.new(rating: 0)
	  expect(review).to have(1).error_on(:rating) 
	end

	it 'is mandatory to leave a rating when reviewing a restaurant' do
		review = Review.new()
		expect(review).to have(1).error_on(:rating)
	end

	
end
