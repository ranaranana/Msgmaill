class UserMailer < ApplicationMailer
	default from: 'aranganathan.ibz@gmail.com'
	def mailer_send(user)
		#p "ujjjjjjjjjjjjjjjj"
		@user = user
		mail(:to =>@user.email, :subject=>"Registered")
	end
end
	