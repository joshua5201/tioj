# == Schema Information
#
# Table name: submissions
#
#  id           :integer          not null, primary key
#  code         :text(16777215)
#  message      :text
#  compiler     :string(255)      default("")
#  result       :string(255)      default("queued")
#  score        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  problem_id   :integer          default(0)
#  user_id      :integer          default(0)
#  contest_id   :integer
#  _result      :string(255)
#  total_time   :integer
#  total_memory :integer
#

class Submission < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  belongs_to :contest
  
  validates_length_of :code, :in => 0..5000000
  validates_length_of :message, :in => 0..65000, :allow_nil => true
  validates_inclusion_of :compiler, :in => %w(c++11 c++ c haskell)
  validates_inclusion_of :compiler, :in => %w(c++11 c++ c), 
    :message => "only c++11 c++ c are allowed during contest",
    :if => :contest?

  def contest?
    contest_id != nil
  end

end
