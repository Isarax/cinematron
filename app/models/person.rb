# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  first_name  :string(255)
#  middle_name :string(255)
#  last_name   :string(255)
#  birth_date  :date
#  country_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :birth_date, :country_id, :profession_id

  belongs_to :country
  has_many :creators
  has_many :professions, through: :creators
  has_many :movies, through: :creators

  def to_s
    first_name.to_s + ' ' + middle_name.to_s + ' ' + last_name.to_s
  end
end
