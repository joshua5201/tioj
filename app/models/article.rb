class Article < ActiveRecord::Base
  has_many :attachments, dependent: :destroy
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => lambda { |a| a[:path].blank? }
end
