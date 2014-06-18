class Contest < ActiveRecord::Base
  has_many :contest_problem_joints, :dependent => :destroy
  has_many :problems, :through => :contest_problem_joints
  
  accepts_nested_attributes_for :contest_problem_joints, :reject_if => lambda { |a| a[:problem_id].blank? }, :allow_destroy => true
end
