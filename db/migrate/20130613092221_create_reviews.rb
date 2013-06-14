class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :reviewable, polymorphic: true
      t.text :body
      t.integer :user_id, null: false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
