class WelcomeController < ApplicationController
  def index
    @bulletins = Article.all.order("id DESC").limit(5)
    @contests = Contest.all.order("id DESC").limit(3)
    @users = User.all.sort_by{|a| -a.ac_count}.take(10)
    # @problem_last = Problem.last
    # @submission_last = Submission.last
  end
end
