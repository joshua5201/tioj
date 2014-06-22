class TestdataSet < ActiveRecord::Base
  default_scope order('id ASC')
  belongs_to :problem
end
