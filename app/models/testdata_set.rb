# == Schema Information
#
# Table name: testdata_sets
#
#  id         :integer          not null, primary key
#  problem_id :integer
#  from       :integer
#  to         :integer
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

class TestdataSet < ActiveRecord::Base
  belongs_to :problem
end
