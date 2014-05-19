require 'spec_helper'

describe 'restaurants index page' do
	context	'start point before any restaurants have been added' do
	  it 'should greet the visitor to page' do
      visit '/restaurants'
	    expect(page).to have_content "Welcome to Yelpy"
    end
  end
end

describe 'adding a restaurant' do
  it 'adds it to the restaurants index' do
    visit '/restaurants/new'
    fill_in 'Name', with: 'Hudsons'
    fill_in 'Address', with: '14 London St, Bath, BA1 5BU'
    click_button 'Create Restaurant'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Hudsons'
  end
end

describe 'editing a restaurant' do
    before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU') }
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
  before { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU') }
  it 'removes a restaurant from the listing' do
    visit '/restaurants'
    click_link 'Delete Hudsons'
    expect(page).not_to have_content 'Hudsons'
    expect(page).to have_content 'Deleted successfully'
    
  end
end
    