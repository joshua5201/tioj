class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(25)
  end
  def show
    @user = User.find(params[:id])
    @problems = Problem.all.order("id ASC")
    
  end
end
