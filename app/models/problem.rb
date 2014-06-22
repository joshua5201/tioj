class Problem < ActiveRecord::Base
  default_scope order('id ASC')
  
  has_many :submissions, dependent: :destroy
  has_many :testdata, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  has_many :contest_problem_joints
  has_many :contests, :through => :contest_problem_joints
  
  has_many :testdata_sets, dependent: :destroy
  accepts_nested_attributes_for :testdata_sets, :allow_destroy => true, :reject_if => :all_blank
  
  accepts_nested_attributes_for :testdata, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :posts, :allow_destroy => true, :reject_if => :all_blank

end
