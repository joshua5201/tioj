class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(25)
  end
  def show
    @user = User.friendly.find(params[:id])
    @problems = @problems = Problem.all.order("id ASC")
  end
end
