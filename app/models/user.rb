# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  nickname               :string(255)
#  avatar                 :string(255)
#  admin                  :boolean          default(FALSE)
#  username               :string(255)
#  motto                  :string(255)
#

require 'file_size_validator'
class User < ActiveRecord::Base
  has_many :submissions, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  validates :avatar,
    #:presence => true,
    :file_size => {
      :maximum => 5.megabytes.to_i
    }
  
  attr_accessor :login
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  validates_presence_of :username, :nickname
  validates :username,
    :uniqueness => {:case_sensitive => false}, 
    :username_convention => true
  
  validates :school, :presence => true, :length => {:minimum => 1}
  validates :gradyear, :presence => true, :inclusion => 1..1000
  validates :name, :presence => true, :length => {:in => 1..12}
  
  validates_uniqueness_of :nickname
  validates_length_of :nickname, :in => 1..12
  validates_length_of :username, :in => 3..20
  validates_length_of :motto, :maximum => 75
  
  def ac_count
    submits = self.submissions.select do |s|
      s.result == "AC" && s.contest_id == nil
    end
    submits = submits.uniq do |s|
      s.problem_id
    end
    submits.count
  end
  
  def in_vain_count
    submits = self.submissions.select do |s|
      s.contest_id == nil
    end
    submits = submits.uniq do |s|
      s.problem_id
    end
    submits = submits.count - self.ac_count
  end
  
  def ac_ratio
    all = self.submissions.select do |s|
      s.contest_id == nil
    end
    ac = all.select do |s|
      s.result == "AC"
    end
    all = all.count
    ac = ac.count
    ratio = (100.0 * ac / all)
    if ratio.nan?
      ratio = 0.0
    end
    ratio
  end
  
  def uniq_submits_by_res(res="AC")
    submits = self.submissions.select do |s|
      s.result == res && s.contest_id == nil
    end
    submits = submits.uniq do |s|
      s.problem_id
    end
  end
  
  def prob_by_res(res="AC")
    submits = self.uniq_submits_by_res(res)
    submits = submits.collect do |s|
      s.problem_id
    end
  end
  extend FriendlyId
  friendly_id :username
end
