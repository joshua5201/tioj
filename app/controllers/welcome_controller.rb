class WelcomeController < ApplicationController
  def index
    @bulletins = Article.order("id DESC").limit(5)
    @contests = Contest.order("id DESC").limit(3)
    ac_count = users.map{|tmp_user| [tmp_user.id,tmp_user.ac_count]}.to_h
    ac_ratio = users.map{|tmp_user| [tmp_user.id,tmp_user.ac_ratio]}.to_h
    @users = User.all.sort{|a, b| (ac_count[a.id] == ac_count[b.id] ? ac_ratio[b.id] <=> ac_ratio[a.id] : ac_count[b.id] <=> ac_count[a.id]) }
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
