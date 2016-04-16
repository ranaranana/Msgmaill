class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
 
	@count = current_user.contacts.count
  	@trashcounts = current_user.messages.where(status: "deleted").count
		  @favorite_count = Message.where(from:current_user.email ,favorite: 'true').count
		  			@send_mail = Message.where(from: current_user.email,status: nil).count

            @inboxcounts =  Message.where(to: current_user.email ,status: nil).count


	end
	def new

	end
	def  calender_h
     

	end
end
