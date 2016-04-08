class MessageController < ApplicationController

 before_action :authenticate_user!
 def index
  @message = Message.where(from: current_user.email)

end
def new
 @message = Message.new
end
def show
  @message = Message.find(params[:id])
  #send_file(@attachment.file.url, disposition: 'attachment')


end
def create
        @message = Message.new(message_params)
      if @message.save
      
      redirect_to message_index_path,notice: "The message #{@message.attachment} has been uploaded."
     else
      render 'new'
    end

  end
def get_inbox
  p"========================"
  p @message = Message.where(to: current_user.email)
  p params

    end
   def destroy
    @message = Message.find(params[:id])
    @message.destroy
 
    redirect_to  root_path
  end
    
 
private
def message_params
 params.require(:message).permit(:to, :from, :subject, :body, :attachment)
end
end
