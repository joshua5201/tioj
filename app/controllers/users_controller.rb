class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(25)
  end
  def show
    @user = User.find(params[:id])
    @problems = @problems = Problem.all.order("id ASC")
  end
  def uniq_submits_by_res(res="AC")
    @submits = @user.submissions.select do |s|
      s.result == 'AC'
    end
    @submits.uniq do |s|
      s.problem
    end
  end
  def prob_by_res(res="AC")
    @submits = uniq_submits_by_res(res)
    @submits.collect do |s|
      s.problem
    end
  end
end
