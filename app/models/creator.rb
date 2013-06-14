# == Schema Information
#
# Table name: creators
#
#  id            :integer          not null, primary key
#  person_id     :integer
#  profession_id :integer
#  movie_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Creator < ActiveRecord::Base
  attr_accessible :id, :movie_id, :profession_id, :person_id

  validates :profession_id, presence: true
  validates :person_id, presence: true
  validates_uniqueness_of :movie_id, scope: [:person_id, :profession_id], message: 'person/profession pair should not repeat'

  belongs_to :person
  belongs_to :profession
  belongs_to :movie
end
