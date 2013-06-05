class CreateGenreMovieJoins < ActiveRecord::Migration
  def change
    create_table :genre_movie_joins do |t|
      t.references :genre
      t.references :movie

      t.timestamps
    end
  end
end
