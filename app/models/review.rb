class Review < ActiveRecord::Base
  attr_accessible :reviewable, :reviewable_type, :body, :user_id
  acts_as_nested_set scope: [:reviewable_id, :reviewable_type]

  validates :user_id, presence: true
  validates :body, presence: true, allow_blank: false
  validates :reviewable_type, presence: true
  validates :reviewable_id, presence: true
  validates_uniqueness_of :user_id, scope: [:reviewable_id]

  belongs_to :reviewable, polymorphic: true
  belongs_to :user
end
