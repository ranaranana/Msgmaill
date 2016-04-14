class ContactController < ApplicationController
#before_action :authenticate_user!
  def index
    @contacts =current_user.contacts.paginate(page: params[:page],per_page:  5)
  	
  	
  end

  def new
  	  @contact =Contact.new
  end
   def  create
   	   @contact =Contact.new(contact_params)
       
   	 if @contact.save
   	   redirect_to contact_index_path
     else
      render 'new'
    end
   end
   def edit 
    @contact = Contact.find(params[:id])
   end
    def show
  	   @contact = Contact.find(params[:id])
  	
  end
def update
  @contact =Contact.find(params[:id])
   if @contact.update(contact_params)
    redirect_to :root
  else
    redirect_to :back
  end
  
end
    
  def destroy
     @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to root_path   
  end
  

   private

    def contact_params
      params.require(:contact).permit(:firstname,:lastname,:email,:mobile,:user_id)
      
end
end
