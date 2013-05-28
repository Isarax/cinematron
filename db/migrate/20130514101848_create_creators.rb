class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.references :person
      t.references :profession
      t.references :movie

      t.timestamps
    end

    #add_index :people_professions, [:person_id, :profession_id], :unique => true
  end
end
