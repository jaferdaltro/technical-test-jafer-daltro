class CreateViewsRatedMovieByGenres < ActiveRecord::Migration[6.1]
  def change
    create_view :views_rated_movie_by_genres
  end
end
