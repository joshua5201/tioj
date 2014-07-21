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
  
end
