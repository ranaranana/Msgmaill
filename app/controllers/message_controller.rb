class MessageController < ApplicationController


  
def update
    @user = User.find_by_activation_token(params[:id])

    @user.update_attribute(:active, true)
    flash[:success] = "Your account is now activated."
    redirect_to root_path
  end


  
# 	def index 
# 	end
  
#   def create
#     @message = Message.new(message_params)

#     @message.sender_id = current_user
#     @message.recipient_id = current_user.friendships.friend_id
#     if @message.save?
#       flash[:success] = 'Message sent successfully'
#       redirect_to welcome_profile_path
#     else
#       render 'new'
#     end
#   end

#   private

#     def message_params
#       params.require(:message).permit(:body, :sender_id, :recipient_id, :user_id)
#     end
# end

end
