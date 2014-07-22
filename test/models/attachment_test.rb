# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  article_id :integer
#  path       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
