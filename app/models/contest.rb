class Contest < ActiveRecord::Base
  has_many :contest_problem_joints, :dependent => :destroy
  has_many :problems, :through => :contest_problem_joints
  
end
