class UsersController < ApplicationController
  def index
    @users = User.all.sort{|a, b| b.ac_ratio <=> a.ac_ratio if a.ac_count == b.ac_count else b.ac_count <=> a.ac_count}
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(25)
  end
  def show
    @user = User.find(params[:id])
    @problems = @problems = Problem.all.order("id ASC")
  end
end
