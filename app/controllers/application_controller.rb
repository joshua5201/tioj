class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_location
  before_filter :set_verdict_hash
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def set_verdict_hash
    @verdict = {"AC" => "Accepted",
                "WA" => "Wrong Answer",
                "TLE" => "Time Limit Exceeded",
                "MLE" => "Segmentation Fault",
                "OLE" => "Output Limit Exceeded",
                "RE" => "Runtime Error",
                "SIG" => "Runtime Error (exited with signal)",
                "CE" => "Compilation Error",
                "CO" => "Compilation Timed Out",
                "ER" => "WTF!"
    }
    @v2i = {"AC" => 0,
            "WA" => 1,
            "TLE" => 2,
            "MLE" => 3,
            "OLE" => 4,
            "RE" => 5,
            "SIG" => 6,
            "CE" => 7,
            "CO" => 8,
            "ER" => 9
    }
    @i2v = {0 => "AC",
            1 => "WA",
            2 => "TLE",
            3 => "MLE",
            4 => "OLE",
            5 => "RE",
            6 => "SIG",
            7 => "CE",
            8 => "CO",
            9 => "ER"
    }
  end

  def store_location
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_out"&&
        request.fullpath != "/users/password"&&
        request.fullpath != "/users/sign_up" &&
        !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  
protected
  def authenticate_admin!
    authenticate_user!
    if not current_user.admin?
      flash[:alert] = 'Insufficient User Permissions.'
      redirect_to action:'index' 
      return
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:school, :gradyear, :name, :email, :nickname, :username, :password, :password_confirmation, :remember_me)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login, :username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:school, :gradyear, :name, :avatar, :avatar_cache, :motto, :email, :nickname, :password, :password_confirmation, :current_password)
    end
  end
  
  def set_contest_layout
    if @contest.blank?
      "application"
    else
      "contest"
    end
  end
  
end
