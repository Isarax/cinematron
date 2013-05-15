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
#  release_date :integer
#  budget       :integer
#  info         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
