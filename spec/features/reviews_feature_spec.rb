require 'spec_helper'

describe 'adding a review' do

before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU', cuisine: 'Steakhouse') }
	
	specify 'restaurant starts with no reviews' do
		  visit '/restaurants'
		  expect(page).to have_content '0 Reviews'
		end

	  it 'adds a review to the restaurant details' do
		  leaves_review('great service and welcoming atmosphere', 4)
			expect(page).to have_content 'great service and welcoming atmosphere'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content '1 Review'
		end

  it "calculates an average rating" do
    leaves_review("Ace", 5)
    leaves_review("OK", 3)	
		expect(page).to have_content 'Average Rating: 4'
	end

	def leaves_review(thoughts, rating)
		visit '/restaurants'
		click_link 'Review Hudsons'
		fill_in 'Thoughts', with: thoughts
		select rating.to_s, from: 'Rating'
		click_button 'Add Review'
	end

end