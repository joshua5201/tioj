class Problem < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :testdata, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  has_many :contest_problem_joints
  has_many :contests, :through => :contest_problem_joints
  
  accepts_nested_attributes_for :testdata, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :posts, :allow_destroy => true, :reject_if => :all_blank

end
