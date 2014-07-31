class WelcomeController < ApplicationController
  def index
    @bulletins = Article.order("id DESC").limit(5)
    @contests = Contest.order("id DESC").limit(3)
    @users = User.all.sort{|a, b| (a.ac_count == b.ac_count ? b.ac_ratio <=> a.ac_ratio : b.ac_count <=> a.ac_count) }
    @users = @users.take(10)
  end
end
