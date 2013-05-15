class CreatePeopleProfessionsJoin < ActiveRecord::Migration
  def change
    create_table 'people_professions', id: false do |t|
      t.references :person
      t.references :profession
    end

    add_index :people_professions, [:person_id, :profession_id], :unique => true
  end
end
