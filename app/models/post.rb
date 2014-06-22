class Post < ActiveRecord::Base
  default_scope order('id ASC')
  
  belongs_to :problem
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :comments
end
