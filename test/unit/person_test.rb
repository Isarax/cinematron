# == Schema Information
#
# Table name: people
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  middle_name   :string(255)
#  last_name     :string(255)
#  birth_date    :date
#  country_id    :integer
#  profession_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
