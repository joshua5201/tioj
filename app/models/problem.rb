class Problem < ActiveRecord::Base
  has_one :limit
  has_many :submissions
  has_many :testdata
  has_many :posts

  accepts_nested_attributes_for :limit, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :testdata, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :posts, :allow_destroy => true, :reject_if => :all_blank

end
