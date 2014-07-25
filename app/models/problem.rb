# == Schema Information
#
# Table name: problems
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  source         :text
#  created_at     :datetime
#  updated_at     :datetime
#  input          :text
#  output         :text
#  example_input  :text
#  example_output :text
#  hint           :text
#  visible_state  :integer          default(0)
#  problem_type   :integer
#  sjcode         :text(16777215)
#  interlib       :text(16777215)
#  old_pid        :integer
#

class Problem < ActiveRecord::Base
  acts_as_taggable_on :tags
  
  has_many :submissions, dependent: :destroy
  
  has_many :contest_problem_joints
  has_many :contests, :through => :contest_problem_joints
  
  has_many :testdata, dependent: :destroy
  accepts_nested_attributes_for :testdata, :allow_destroy => true, :reject_if => :all_blank
  
  has_many :testdata_sets, dependent: :destroy
  accepts_nested_attributes_for :testdata_sets, :allow_destroy => true, :reject_if => :all_blank
  
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts, :allow_destroy => true, :reject_if => :all_blank
  
  validates_length_of :sjcode, maximum: 5000000
  validates_length_of :interlib, maximum: 5000000
  
end
