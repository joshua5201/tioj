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

class Attachment < ActiveRecord::Base
  belongs_to :article
  
  mount_uploader :path, AttachmentUploader
end
