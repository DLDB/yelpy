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