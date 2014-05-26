require 'spec_helper'

describe 'adding a review' do

  before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU', cuisine: 'Steakhouse') }

  specify 'restaurant starts with no reviews' do
    visit '/restaurants'
    expect(page).to have_content '0 Reviews'
  end

  it 'adds a review to the restaurant details', js: true do
    leaves_review('great service and welcoming atmosphere', 4)
    expect(page).to have_content 'great service and welcoming atmosphere'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content '1 review'
  end

  xit "calculates an average rating", js: true do
    leaves_review("Ace", 5)
    leaves_review("OK", 3)
    expect(page).to have_content 'Average Rating: 4'
  end

  xit "shows filled stars to indicate rating", js: true do
  	leaves_review("Ace", 5)
    leaves_review("OK", 3)
    expect(page).to have_content '★★★★★'
    expect(page).to have_content '★★★☆☆'
  end

  def leaves_review(thoughts, rating)
    visit '/restaurants'
    
    fill_in 'Thoughts', with: thoughts
    select rating.to_s, from: 'Rating'
    click_button 'Add Review'
  end

end
