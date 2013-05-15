class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birth_date

      t.references :country, index: true

      t.timestamps
    end
  end
end
