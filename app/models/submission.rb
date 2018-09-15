# == Schema Information
#
# Table name: submissions
#
#  id           :integer          not null, primary key
#  code         :text(16777215)
#  compiler     :string(255)      default("")
#  result       :string(255)      default("queued")
#  score        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  problem_id   :integer          default(0)
#  user_id      :integer          default(0)
#  contest_id   :integer
#  _result      :text(65535)
#  total_time   :integer
#  total_memory :integer
#  message      :text(65535)
#

class Submission < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  belongs_to :contest
  
  validates_length_of :code, :in => 0..5000000
  validates_length_of :message, :in => 0..65000, :allow_nil => true
  validates_inclusion_of :compiler, :in => %w(c++17 c++14 c++11 c++98 c11 c99 c90 haskell python2 python3)
  validates_inclusion_of :compiler, :in => %w(c++17 c++14 c++11 c++98 c11 c99 c90), 
    :message => "only c/c++ are allowed during contest",
    :if => :contest?

  def contest?
    contest_id != nil
  end

end
