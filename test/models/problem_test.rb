# == Schema Information
#
# Table name: problems
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  source         :text
#  created_at     :datetime
#  updated_at     :datetime
#  input          :text
#  output         :text
#  example_input  :text
#  example_output :text
#  hint           :text
#  visible_state  :integer          default(0)
#  problem_type   :integer
#  sjcode         :text(16777215)
#  interlib       :text(16777215)
#

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
