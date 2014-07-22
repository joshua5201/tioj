# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  problem_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :problem
  has_many :comments, dependent: :destroy
  
  validates_length_of :title, :in => 0..30
  validates_length_of :content, :in => 0..3000
  
  accepts_nested_attributes_for :comments
end
