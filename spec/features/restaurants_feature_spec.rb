require 'spec_helper'

describe 'restaurants index page' do
	context	'start point before any restaurants have been added' do
	  it 'should greet the visitor to page' do
      visit '/restaurants'
	    expect(page).to have_content "Welcome to Yelpy"
      expect(page).to have_link 'Add Restaurant'
    end
  end
end

describe 'adding a restaurant' do
  it 'adds it to the restaurants index' do
    visit '/restaurants/new'
    fill_in 'Name', with: 'Hudsons'
    fill_in 'Address', with: '14 London St, Bath, BA1 5BU'
    fill_in 'Cuisine', with: 'Steakhouse'
    click_button 'Create Restaurant'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Hudsons'
  end
  it "generates an error message if form data invalid" do
    visit '/restaurants/new'
    fill_in 'Name', with: 'yo sushi'
    fill_in 'Address', with: '15'
    fill_in 'Cuisine', with: 'japanese'
    click_button 'Create Restaurant'
    expect(page).to have_content 'Error'
    expect(page).to have_button 'Create Restaurant'
  end
end

describe 'editing a restaurant' do
    before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU', cuisine: 'Steakhouse') }
  it 'edits a restaurant' do
    visit '/restaurants'
    click_link 'Edit Hudsons'

    fill_in 'Name', with: 'Waggamama'
    click_button 'Update Restaurant'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Waggamama'
  end
end

describe 'deleting a restaurant' do
  before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU', cuisine: 'Steakhouse') }
  it 'removes a restaurant from the listing' do
    visit '/restaurants'
    click_link 'Delete Hudsons'
    expect(page).not_to have_content 'Hudsons'
    expect(page).to have_content 'Deleted successfully'
    
  end
end




    