require 'spec_helper'

describe ReviewsHelper do

  describe '#star_rating' do

    it 'shows five filled stars for a rating of 5' do
      expect(star_rating(5)).to eq '★★★★★'
    end

    it 'shows three filled stars and two empty stars for a rating of 3' do
      expect(star_rating(3)).to eq '★★★☆☆'
    end

   it 'shows three filled stars and two empty stars for a rating of 2.7' do
      expect(star_rating(2.7)).to eq '★★★☆☆'
    end

  end
end
