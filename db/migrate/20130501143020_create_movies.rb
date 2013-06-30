class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :poster
      t.string :trailer
      t.integer :min_age
      t.integer :length
      t.date :release_date
      t.text :info

      t.references :country, index: true

      t.timestamps
    end
  end
end
  