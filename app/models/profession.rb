# == Schema Information
#
# Table name: professions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profession < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true , uniqueness: true, length: { maximum: 50 }

  has_many :creators
  has_many :people, through: :creators
end
