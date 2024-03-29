class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration
  def self.up
    create_table :comments, force: true do |t|
      t.belongs_to :commentable, polymorphic: true
      t.string :title, default: ""
      t.text :body, default: ""
      t.string :subject, default: ""
      t.integer :user_id, default: 0, null: false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, [:commentable_id, :commentable_type]
  end
  
  def self.down
    drop_table :comments
  end
end
