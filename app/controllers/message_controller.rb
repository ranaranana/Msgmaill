class MessageController < ApplicationController
  #helper_method :message

 before_action :authenticate_user!
 def index
      
       @message = Message.where(from: current_user.email,status: nil).paginate(page: params[:page],per_page:  2)
        @search = Message.ransack(params[:q])
        @message = @search.result.paginate(page: params[:page],per_page:  2)
        @send_mail = Message.where(from: current_user.email,status: nil).count


  end

 def new
    @message = Message.new

     end
  def show
          @message = Message.find(params[:id])
      
     end

  def create
           @message = Message.new(message_params)
              if @message.save

                  redirect_to message_index_path,notice: "The message #{@message.attachment} has been uploaded."
                     else
                         render 'new'
              end

    end

    def destroy
             @message = Message.find(params[:id])
             @message.update(status: 'deleted')
            redirect_to message_index_path
    end

    def get_inbox

          p"========================"
          @inboxlimit = current_user.settings.pluck(:inboxlimit).first
          p @message = Message.where(to: current_user.email ,status: nil).paginate(page: params[:page],per_page:  @inboxlimit)
          @q= Message.ransack(params[:q])
          @message = @q.result.paginate(page: params[:page],per_page:  @inboxlimit)
         @inboxcounts =  Message.where(to: current_user.email ,status: nil).count



            
          
          
       end

    def trash
            @message = Message.where(to: current_user.id ,status: 'deleted')
          # => @message = Message.where(from: current_user.id,status:  'deleted')
        @trashcounts = current_user.messages.where(status: "deleted").count

    end

    def  restore
             @message = Message.find(params[:id])
            @message.update(status: nil)
       
               redirect_to root_path

      end



    def remove
             @message = Message.find(params[:id])
             @message.destroy
             redirect_to  message_trash_path
    end

    def favorite_msg
             p current_user.email
              p "111111111111"
              @message = Message.where(from:current_user.email ,favorite: 'true')
              p "==========================="
              p @message
              p "_________________________________"
             @favorite_count = Message.where(from:current_user.email ,favorite: 'true').count
    end
  
  def favorite_update
        @message = Message.find(params[:id])
        @message.update_attributes(favorite: 'true')
        redirect_to root_path 

   end
  

private

      def message_params
         params.require(:message).permit(:to, :from, :subject, :body, :attachment)
      end
end
