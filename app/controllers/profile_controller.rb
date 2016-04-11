class ProfileController < ApplicationController
	def index
		@profile = User.find(current_user.id)
		
	end

	def edit
		@profile = User.find(current_user.id)
	end
	def update
		@profile = User.find(current_user.id)
		if@profile.update(profile_params)
			redirect_to  index_profile_path
		else
			redirect_to :back
		end
	end	

	private
	def profile_params
	params.require(:user).permit(:street,  :city  ,:state,:country, :zipcode,:image)
	end
	
end
