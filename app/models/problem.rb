class Problem < ActiveRecord::Base
  has_one :limit, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :testdata, dependent: :destroy
  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :limit, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :testdata, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :posts, :allow_destroy => true, :reject_if => :all_blank

end
