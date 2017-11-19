class UsersController < ApplicationController
  def index
    ac_count = users.map{|tmp_user| [tmp_user.id,tmp_user.ac_count]}.to_h
    ac_ratio = users.map{|tmp_user| [tmp_user.id,tmp_user.ac_ratio]}.to_h
    @users = User.sorted
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
