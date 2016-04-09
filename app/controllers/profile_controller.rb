class ProfileController < ApplicationController

	def edit
		@profile = User.find(current_user.id)
	end
	def update
		@profile = User.find(current_user.id)
		if@profile.update(profile_params)
			redirect_to :root
		else
			redirect_to :back
		end
	end	

	private
	def profile_params
	params.require(:user).permit(:street,  :city  ,:state,:country, :zipcode,:profile)
	end
	
end
