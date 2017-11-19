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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test ".ac_counts" do
    a = User.ac_counts
    p a
    assert_equal(a.size, User.count)
    a.each {|elem| assert_equal(elem[1], User.find(elem[0]).ac_count)}
  end
  test ".ac_ratios" do
    a = User.ac_ratios
    assert_equal(a.size, User.count)
    a.each {|elem| assert_equal(elem[1], User.find(elem[0]).ac_ratio)}
  end
  test ".sorted" do
    a = User.sorted
    assert_equal(a.size, User.count)
    a.each_cons(2).each do |i, j|
      better = i.ac_ratio > j.ac_ratio
      more = i.ac_ratio == j.ac_ratio && i.ac_count > j.ac_count
      assert (better or more)
    end
  end
end
