# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  poster       :string(255)
#  trailer      :string(255)
#  min_age      :integer
#  length       :integer
#  release_date :date
#  budget       :integer
#  info         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ActiveRecord::Base
  attr_accessible :name, :poster, :trailer, :min_age, :release_date, :length, :budget, :info

  #validation
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :min_age, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..21}
  validates :release_date, presence: true
  validates :length, presence: true, inclusion: {in: 0..400}
  validates :budget, presence: true
end
