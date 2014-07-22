# == Schema Information
#
# Table name: contests
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  start_time   :datetime
#  end_time     :datetime
#  contest_type :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
