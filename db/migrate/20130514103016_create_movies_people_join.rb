class CreateMoviesPeopleJoin < ActiveRecord::Migration
  def change
    create_table 'movies_people', id: false do |t|
      t.references :movie
      t.references :person
    end

    add_index :movies_people, [:movie_id, :person_id], :unique => true
  end
end
