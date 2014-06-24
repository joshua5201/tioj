class Submission < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  belongs_to :contest
  
  validates_length_of :code, maximum: 5000000
end
