class Movie < ApplicationRecord
  has_many :ratings

  validates :title, presence: true
  validates :release_date, presence: true
end
