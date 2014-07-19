class WelcomeController < ApplicationController
  def index
    @bulletins = Article.all.order("id DESC").limit(7)
    @contests = Contest.all.order("id DESC").limit(3)
    @users = User.all.order("id DESC").limit(10)
    # @problem_last = Problem.last
    # @submission_last = Submission.last
  end
end
