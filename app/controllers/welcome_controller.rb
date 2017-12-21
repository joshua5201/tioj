class WelcomeController < ApplicationController
  def index
    @bulletins = Article.order("id DESC").limit(5)
    @contests = Contest.order("id DESC").limit(3)
    @users = ActiveRecord::Base.connection.execute("select u.id user_id, count(distinct case when s.result='AC' then s.problem_id end) ac, ifnull(sum(s.result='AC'), 0) acsub,  count(s.id) sub, sum(s.result='AC') / count(s.id) acratio from users u left join submissions s on s.user_id = u.id and s.contest_id is NULL group by u.id order by ac desc, acratio desc, sub desc, user_id asc;")
    @users = @users.to_a.take(10)
  end
  
  def edit_announcement
    authenticate_admin!
  end
  
  def alter_announcement
    authenticate_admin!
    anno = {:name => params[:name].to_s, :message => params[:message].to_s}
    File.open("public/announcement/anno", "w") do |f|
      f.write(anno.to_json)
    end
    redirect_to root_path
  end
end
