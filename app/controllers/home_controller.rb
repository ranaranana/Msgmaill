class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
 
	@count = current_user.contacts.count
   @count_inbox = Message.where(to: current_user.email ,status: nil).count
	#@count_inbox =current_user.settings.count
	#@count_send = current_user.messages.count
	end
	def new

	end
	def  calender_h
     

	end
end
