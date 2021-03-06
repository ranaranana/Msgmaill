class ApplicationController < ActionController::Base
  
   helper_method :jdenticon
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  private
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:firstname, :lastname,:username, :role, :email,:brithday, :password, :password_confirmation)}        
  	devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:firstname, :lastname,:username, :role, :email,:brithday, :password, :password_confirmation) }          
  end


  def jdenticon
      md5 = Digest::MD5.new
      md5.update current_user.email
      md5.hexdigest 
    
  end
  # def login=(login)
  # 	@login = login
  # end

  # def login
  # 	@login || self.username || self.email
  # end
end
