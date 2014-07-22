# == Schema Information
#
# Table name: limits
#
#  id           :integer          not null, primary key
#  time         :integer          default(1000)
#  memory       :integer          default(65536)
#  output       :integer          default(65536)
#  created_at   :datetime
#  updated_at   :datetime
#  testdatum_id :integer
#

class Limit < ActiveRecord::Base
  belongs_to :testdatum
end
