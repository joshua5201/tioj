class WelcomeController < ApplicationController
  def index
    @bulletins = Article.all.order("id DESC").limit(5)
    @contests = Contest.all.order("id DESC").limit(3)
    @users = User.all.sort{|a, b| (a.ac_count == b.ac_count ? (b.ac_ratio*10000) <=> (a.ac_ratio*10000) : b.ac_count <=> a.ac_count) }
    @users = @users.take(10)
    # @problem_last = Problem.last
    # @submission_last = Submission.last
  end
end
