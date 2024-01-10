namespace :populate_movies do
  desc 'Populate movies'
  task movies: :environment do
    Movie.create(
      title: 'Interstellar',
      release_date: Date.parse('07 Nov 2014'),
      runtime: '169 min',
      genre: 'Adventure, Drama, Sci-Fi',
      parental_rating: 'PG-13',
      plot: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."
    )

    Movie.create(
      title: 'Doctor Strange in the Multiverse of Madness',
      release_date: Date.parse('06 May 2022'),
      runtime: 'N/A',
      genre: 'Fantasy, Action, Adventure, Horror',
      parental_rating: 'N/A'
    )

    Movie.create(
      title: 'Avatar 2',
      release_date: Date.parse('16 December 2022'),
      runtime: 'N/A',
      genre: 'Action, Adventure, Science Fiction, Fantasy',
      parental_rating: 'N/A',
      plot: 'Twelve years after exploring Pandora and joining the Na’vi, Jake Sully has since raised a family with Neytiri and established himself within the clans of the new world. Of course, peace can only last so long. Especially when the military organization from the original film returns to “finish what they started”.'
    )

    10.times do
      Movie.create(
        title: Faker::Movie.title,
        release_date: Date.today - rand(1..1825),
        runtime: (rand(1..100) * 5).to_s + ' min',
        genre: %w[Action Adventure Science Fiction Fantasy].sample,
        parental_rating: %w[PG-13 NC-17 G R].sample,
        plot: Faker::Movie.quote
      )
    end
  end
end
