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
  validate_presence_of :username, :nickname
  validates :username,
    :uniqueness => {
    :case_sensitive => false
  }
  validates_uniqueness_of :nickname


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
