# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  era        :integer
#  pinned     :boolean
#  category   :integer
#

class Article < ActiveRecord::Base
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => lambda { |a| a[:path].blank? }
end
