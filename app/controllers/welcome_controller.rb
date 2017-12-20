class WelcomeController < ApplicationController
  def index
    @bulletins = Article.order("id DESC").limit(5)
    @contests = Contest.order("id DESC").limit(3)
    @users = ActiveRecord::Base.connection.execute("select user_id, count(distinct case when result='AC' then problem_id end) ac, sum(result='AC') acsub, count(*) sub, sum(result='AC') / count(*) acratio from submissions where contest_id <=> NULL group by user_id union select id, 0, 0, 0, NULL from users where id not in (select distinct user_id from submissions where contest_id <=> NULL) order by ac desc, acratio desc, sub desc, user_id;").to_a
    @users = @users.take(10)
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
