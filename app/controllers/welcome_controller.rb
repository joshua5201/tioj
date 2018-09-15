class WelcomeController < ApplicationController
  def index
    @bulletins = Article.order("id DESC").where(pinned: 1).limit(5)
    @bulletins = @bulletins + Article.order("id DESC").where(pinned: 0).limit(5 - @bulletins.size)
    @contests = Contest.order("id DESC").limit(3)
    @users = get_sorted_user.take(10)
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
