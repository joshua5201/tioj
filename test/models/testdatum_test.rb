# == Schema Information
#
# Table name: testdata
#
#  id          :integer          not null, primary key
#  problem_id  :integer
#  test_input  :string(255)
#  test_output :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class TestdatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
