class UsersController < ApplicationController
  def index
    # Array of [user_id,ac_cnt,acsub_cnt,sub_cnt,acratio]
    @users = ActiveRecord::Base.connection.execute("select u.id user_id, count(distinct case when s.result='AC' then s.problem_id end) ac, ifnull(sum(s.result='AC'), 0) acsub,  count(s.id) sub, sum(s.result='AC') / count(s.id) acratio from users u left join submissions s on s.user_id = u.id and s.contest_id is NULL group by u.id order by ac desc, acratio desc, sub desc, user_id asc;").to_a
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
