# == Schema Information
#
# Table name: genre_movie_joins
#
#  id         :integer          not null, primary key
#  genre_id   :integer
#  movie_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GenreMovieJoin < ActiveRecord::Base
  attr_accessible :id, :movie_id, :genre_id

  validates :movie_id, presence: true
  validates :genre_id, presence: true
  validates_uniqueness_of :genre_id, scope: [:movie_id], message: 'genres should not repeat'

  belongs_to :movie
  belongs_to :genre
end
