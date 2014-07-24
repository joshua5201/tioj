class RegistrationsController < Devise::RegistrationsController
  
  def new
    set_page_title "Register"
    super
  end
        
  def edit
    set_page_title "Edit Account"
    super
  end
    
  def create
    resource.remote_avatar_url = "http://avatar.3sd.me/100"
    #resource.save
    super
  end

  def update
    super
  end
  
end 