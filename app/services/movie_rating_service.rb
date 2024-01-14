class MovieRatingService
  def self.calculate_rating(movie)
    return 0 if movie.ratings.empty?

    total_grade = movie.ratings.sum(&:grade)
    total_grade / movie.ratings.count
  end
end
