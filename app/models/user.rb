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
#

class User < ActiveRecord::Base
  has_many :submissions, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
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
    :uniqueness => {
    :case_sensitive => false
  }
  validates_uniqueness_of :nickname
  
  
  def ac_count
    self.uniq_submits_by_res("AC").count
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
  end
  
  def uniq_submits_by_res(res="AC")
    submits = self.submissions.select do |s|
      s.result == res && s.contest_id == nil
    end
    submits.uniq do |s|
      s.problem
    end
  end
  
  def prob_by_res(res="AC")
    submits = self.uniq_submits_by_res(res)
    submits.collect do |s|
      s.problem
    end
  end
  extend FriendlyId
  friendly_id :username
end
