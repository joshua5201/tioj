class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  def new
    super
    set_page_title "Register"
  end
        
  def edit
    super
    set_page_title "Edit Account"
  end
    
  def create
    super
    resource.remote_avatar_url = "http://avatar.3sd.me/100"
    resource.save
  end

  def update
    super
  end

  protected
 
  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :email, :nickname, :username, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:avatar, :avatar_cache, :motto,
        :email, :nickname, :password, :password_confirmation, :current_password)
    end
  end
end 