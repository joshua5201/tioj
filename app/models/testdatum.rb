class Testdatum < ActiveRecord::Base
  default_scope order('id ASC')
  
  belongs_to :problem
  has_one :limit, dependent: :destroy
  accepts_nested_attributes_for :limit, :allow_destroy => true
  
  mount_uploader :test_input, TestdataUploader
  mount_uploader :test_output, TestdataUploader
end
