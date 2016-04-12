class Message < ActiveRecord::Base

	belongs_to :user
	belongs_to :trash
	mount_uploader :attachment, AttachmentUploader
	#validates :attachment, file_size: { less_than: 2.gigabytes }

	def self.message_by_paginate
		paginate(:all, :per_page => 25, :conditions => ["published = ?", true])
	end
end
