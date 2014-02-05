class Problem < ActiveRecord::Base
  has_one :limit, :inverse_of => :problem
  has_many :submissions
  has_many :testdata, :inverse_of => :problem

  accepts_nested_attributes_for :limit, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :testdata, :allow_destroy => true, :reject_if => :all_blank

end
