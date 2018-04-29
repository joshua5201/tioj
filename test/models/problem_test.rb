# == Schema Information
#
# Table name: problems
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text(65535)
#  source         :text(65535)
#  created_at     :datetime
#  updated_at     :datetime
#  input          :text(65535)
#  output         :text(65535)
#  example_input  :text(65535)
#  example_output :text(65535)
#  hint           :text(65535)
#  visible_state  :integer          default(0)
#  problem_type   :integer
#  sjcode         :text(16777215)
#  interlib       :text(16777215)
#  old_pid        :integer
#

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
