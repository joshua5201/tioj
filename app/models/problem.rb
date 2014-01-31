class Problem < ActiveRecord::Base
  has_one :limit
  has_many :submissions
  has_many :testdata
end
