# == Schema Information
#
# Table name: contests
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text(65535)
#  start_time   :datetime
#  end_time     :datetime
#  contest_type :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Contest < ActiveRecord::Base
  has_many :contest_problem_joints, :dependent => :destroy
  has_many :problems, :through => :contest_problem_joints
  has_many :submissions

  validates :start_time, :presence => true
  validates :end_time, :presence => true

  accepts_nested_attributes_for :contest_problem_joints, :reject_if => lambda { |a| a[:problem_id].blank? }, :allow_destroy => true
end
