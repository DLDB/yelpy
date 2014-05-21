require 'spec_helper'

describe Restaurant do
  it "should raise an error if name not provided" do
  	restaurant = Restaurant.new(name: nil)
  	expect(restaurant).to have(1).error_on(:name)
  end

  it "should raise an error if address not provided" do
  	restaurant = Restaurant.new(address: nil)
  	expect(restaurant).to have(2).errors_on(:address)
  end

  it "should raise an error if cuisine not provided" do
  	restaurant = Restaurant.new(cuisine: nil)
  	expect(restaurant).to have(1).error_on(:cuisine)
  end

  it "should raise an error if name not unique at that address" do
  	restaurant = Restaurant.create(name: "Yo Sushi", address: "24 Highview", cuisine: 'Japanese')
  	restaurant2 = Restaurant.new(name: "Yo Sushi", address: "24 Highview", cuisine: 'Japanese')
  	expect(restaurant).to have(0).errors_on(:name) 
  	expect(restaurant2).to have(1).error_on(:name)
  end

  it "should not raise an error if name unique at that address" do
  	restaurant = Restaurant.create(name: "Yo Sushi", address: "34 Highview", cuisine: 'Japanese')
  	restaurant2 = Restaurant.new(name: "Yo Sushi", address: "24 Highview", cuisine: 'Japanese')
  	expect(restaurant).to have(0).errors_on(:name) 
  	expect(restaurant2).to have(0).error_on(:name)
  end

  it "should raise an error if address is too short" do
  	restaurant = Restaurant.new(address: '1')
  	expect(restaurant).to have(1).error_on(:address)
  end

end

describe '#average_rating' do

  let(:restaurant) { Restaurant.create(name: 'Hudsons', address: '14 London St, Bath, BA1 5BU', cuisine: 'Steakhouse') }

  context 'it has no reviews' do
    it "returns n/a" do
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end

  context 'it has one review' do
    before { restaurant.reviews.create(rating: 3) }
    it "shows the score of that review" do
      expect(restaurant.average_rating).to eq 3
    end
  end

  context 'several reviews' do
    before { restaurant.reviews.create(rating: 3) }
    before { restaurant.reviews.create(rating: 2) }
    before { restaurant.reviews.create(rating: 4) }
    before { restaurant.reviews.create(rating: 5) }
    it 'calculates the average rating' do
      expect(restaurant.average_rating).to eq 3.5
    end
  end

end