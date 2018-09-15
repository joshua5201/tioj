# == Schema Information
#
# Table name: testdata
#
#  id          :integer          not null, primary key
#  problem_id  :integer
#  test_input  :string(255)
#  test_output :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  position    :integer
#

class Testdatum < ActiveRecord::Base
  belongs_to :problem
  acts_as_list scope: :problem
  has_one :limit, dependent: :destroy
  accepts_nested_attributes_for :limit, :allow_destroy => true
  
  mount_uploader :test_input, TestdataUploader
  mount_uploader :test_output, TestdataUploader
  
  validates :test_input, :presence => true
  validates :test_output, :presence => true
end
