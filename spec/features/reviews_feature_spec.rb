require 'spec_helper'

describe 'adding a review' do
before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU', cuisine: 'Steakhouse') }
	specify 'restaurant starts with no reviews' do
		  visit '/restaurants'
		  expect(page).to have_content '0 Reviews'
		end

	  it 'adds a review to the restaurant details' do
			visit '/restaurants'
			click_link 'Review Hudsons'
			fill_in 'Thoughts', with: "great service and welcoming atmosphere"
			select '4', from: 'Rating'
			click_button 'Add Review'

			expect(page).to have_content 'great service and welcoming atmosphere'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content '1 Review'
		end
	end