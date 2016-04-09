class Message < ActiveRecord::Base
	belongs_to :user
	mount_uploader :attachment, AttachmentUploader
	#validates :attachment, file_size: { less_than: 2.gigabytes }
end
