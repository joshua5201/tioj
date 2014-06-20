class Testdatum < ActiveRecord::Base
  belongs_to :problem
  mount_uploader :test_input, TestdataUploader
  mount_uploader :test_output, TestdataUploader
end
