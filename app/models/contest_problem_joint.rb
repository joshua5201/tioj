# == Schema Information
#
# Table name: contest_problem_joints
#
#  id         :integer          not null, primary key
#  contest_id :integer
#  problem_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class ContestProblemJoint < ActiveRecord::Base
  default_scope { order('id ASC') }
  
  belongs_to :contest
  belongs_to :problem
end
