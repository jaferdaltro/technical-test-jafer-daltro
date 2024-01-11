FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    release_date { "2021-11-01" }
    runtime { "MyString" }
    genre { %w[Action Adventure Science Fiction Fantasy].sample }
    parental_rating { %w[PG-13 NC-17 G R].sample }
    plot { "MyText" }
  end

  trait :with_ratings do
    after(:create) do |movie|
      create(:rating, movie: movie)

      movie.reload
    end
  
  end
end
