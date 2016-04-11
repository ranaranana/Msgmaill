class Contact < ActiveRecord::Base
	belongs_to :user
	validates :email ,:firstname,:lastname,:mobile, presence:{ message: 'should have some words in it' }
	validates :firstname,:lastname,:mobile, uniqueness:{ case_sensitive: false }
	# validates :mobile,  :presence => {:message => 'hello world, bad operation!'},
 #                     :numericality => true,
 #                     :length => { greater_than_or_equal_to: 0, less_than: 1_000_000}
end

