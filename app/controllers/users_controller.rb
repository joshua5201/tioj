class UsersController < ApplicationController
  def index
    @users = User.all.sort_by{|a| -a.ac_count}
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(25)
  end
  def show
    @user = User.find(params[:id])
    @problems = @problems = Problem.all.order("id ASC")
  end
end
