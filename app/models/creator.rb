# == Schema Information
#
# Table name: creators
#
#  id            :integer          not null, primary key
#  person_id     :integer
#  profession_id :integer
#  movie_id      :integer
#

class Creator < ActiveRecord::Base
  attr_accessible :id, :movie_id, :profession_id, :person_id
  belongs_to :person
  belongs_to :profession
  belongs_to :movie
end
