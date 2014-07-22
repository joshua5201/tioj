# == Schema Information
#
# Table name: judge_servers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  ip         :string(255)
#  key        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class JudgeServer < ActiveRecord::Base
end
