class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :poster
      t.string :trailer
      t.integer :min_age
      t.integer :length
      t.integer :release_date
      t.integer :budget
      t.text :info

      t.timestamps
    end
  end
end
