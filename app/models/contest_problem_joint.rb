class ContestProblemJoint < ActiveRecord::Base
  default_scope order('id ASC')
  
  belongs_to :contest
  belongs_to :problem
end
