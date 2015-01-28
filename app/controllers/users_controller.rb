class UsersController < ApplicationController
  def index
    @users = User.all.sort{|a, b| (a.ac_count == b.ac_count ? b.ac_ratio <=> a.ac_ratio : b.ac_count <=> a.ac_count) }
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(25)
    set_page_title "Users"
  end
  def show
    begin
      @user = User.friendly.find(params[:id])
      if @user.blank?
        redirect_to users_path, :alert => "Username '#{params[:id]}' not found."
        return
      end
    rescue ActiveRecord::RecordNotFound => e
      redirect_to users_path, :alert => "Username '#{params[:id]}' not found."
      return
    end
    @problems = Problem.select("id").order("id ASC")
    tried = @user.submissions.select("problem_id, MIN(result) as result").group("problem_id")
    @tried = Array.new(@problems.count + 1)
    tried.each do |t|
      @tried[t.problem_id] = (t.result == "AC" ? 1 : 2)
    end
    
    set_page_title @user.username
  end
end
