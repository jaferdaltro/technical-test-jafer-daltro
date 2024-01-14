require 'rails_helper'

RSpec.describe MovieRatingService do
  describe '.calculate_average_rating' do
    it 'returns 0 for a movie with no ratings' do
      movie = build(:movie)
      expect(described_class.calculate_rating(movie)).to eq(0)
    end

    it 'calculates the average rating for a movie with ratings' do
      movie = build(:movie, :with_ratings)
      movie.ratings << build(:rating, grade: 3)
      movie.save!
      
      expect(described_class.calculate_rating(movie)).to eq(3.0)
    end
  end
end
