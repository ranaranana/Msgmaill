class MessageController < ApplicationController
  #helper_method :message

 before_action :authenticate_user!
 def index
  @message = Message.where(from: current_user.email,status: nil).paginate(page: params[:page],per_page:  2)
  @search = Message.ransack(params[:q])
  @message = @search.result.paginate(page: params[:page],per_page:  2)
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

    def destroy
      @message = Message.find(params[:id])
      @message.update(status: 'deleted')
      redirect_to message_index_path
    end

    def get_inbox
      p"========================"
      p @message = Message.where(to: current_user.email ,status: nil).paginate(page: params[:page],per_page:  5)
      @q= Message.ransack(params[:q])
      @message = @q.result
            #@message = Message.where(from: current_user.email ,status: nil)
            p params

          end

          def trash
            @message = Message.where(to: current_user.email ,status: 'deleted')
            @message = Message.where(from: current_user.email, status: 'deleted')

          end

          def  restore
            @message = Message.find(params[:id])
            @message.update(status: nil)
        #redirect_to  get_inbox_path
        redirect_to root_path

      end



      def remove
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to  message_trash_path
      end
  def  favorite_msg
      @message = Message.find(params[to: current_user.email]) 
       
  end
# def page
#   @message = Message.find(params[:id])

#   end
private

def message_params
  params.require(:message).permit(:to, :from, :subject, :body, :attachment)
end
end
