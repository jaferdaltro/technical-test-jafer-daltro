require 'rails_helper'

RSpec.describe Views::RatedMovieByGenre, type: :model do
  subject { described_class.all }
  it 'returns most rated' do
    action_1 = create(:movie, :with_ratings)
    action_2 = create(:movie, :with_ratings)
    result = action_1.ratings.map(&:grade).max > action_2.ratings.map(&:grade).max ? action_1 : action_2

     expect(subject.collect(&:movie)).to include(result.title)
  end
end
