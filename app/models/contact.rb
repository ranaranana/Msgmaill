class Contact < ActiveRecord::Base
	belongs_to :user
	validates :email ,:mobile, presence: true
	# validates :mobile,  :presence => {:message => 'hello world, bad operation!'},
 #                     :numericality => true,
 #                     :length => { greater_than_or_equal_to: 0, less_than: 1_000_000}
end
