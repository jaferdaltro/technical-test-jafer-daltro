module Movies
  class API < Grape::API
    version 'v1', using: :path
    prefix "api"
    format :json

    resource :movies do
      desc 'returns all movies'
      get do
        movies = Movie.includes(:ratings).order(:release_date).reverse_order

        movies.each do |movie|
          movie.rating = MovieRatingService.calculate_rating(movie)
        end
      end

      desc 'searches a movie using title'
      params do
        optional :title, type: String, desc: 'search term'
      end

      get '/search' do
        movies = Movie.where('title ILIKE ?', "%#{params[:title]}%")

        error!("nothing for this search", :not_found) if movies.empty?

        movies.first
      end

      desc 'Show information about a particular movie'
      params do
        requires :id, type: String, desc: 'movie ID.'
      end

      get '/:id' do
        movie = Movie.find_by_id(params[:id])

        error!('Movie not fount', :not_found) unless movie

        movie_rating = MovieRatingService.calculate_rating(movie)
        movie
      end

      desc 'Create a movie.'
      params do
        requires :movie, type: Hash do
          requires :title, type: String, desc: 'Movie title.'
          requires :release_date, type: Date, desc: 'Movie release date'
          optional :runtime, type: String, desc: 'Movie runtime'
          optional :genre, type: String, desc: 'Movie genre'
          optional :parental_rating, type: String, desc: 'Movie'
          optional :plot, type: String, desc: 'Movie'
        end
      end

      post do
        Movie.create!(params[:movie])
      end

      desc 'Delete a movie.'
      params do
        requires :id, type: String, desc: 'movie ID.'
      end
      delete ':id' do
        movie = Movie.find(params[:id])

        error!('Movie not found', :not_found) unless movie

        movie.destroy
        { message: 'Movie deleted successfully' }
      end
    end
  end
end
