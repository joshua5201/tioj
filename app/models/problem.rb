class Problem < ActiveRecord::Base
  has_one :limit, :inverse_of => :problem
  has_many :submissions
  has_many :testdata
  accepts_nested_attributes_for :limit
end
