namespace :populate_ratings do
  desc 'Populate ratings'
  task ratings: :environment do
    Movie.all.each do |movie|
      Rating.create(
        movie: movie,
        grade: rand(1..5)
      )
    end
  end
end