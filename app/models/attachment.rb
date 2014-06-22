class Attachment < ActiveRecord::Base
  default_scope order('id ASC')
  
  belongs_to :article
  
  mount_uploader :path, AttachmentUploader
end
