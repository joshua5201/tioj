class JudgeServersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_judge_server, only: [:show, :edit, :update, :destroy]
  require 'securerandom'
  def index
    @judge_servers = JudgeServer.all
  end

  def new
    @judge_server = JudgeServer.new
    @judge_server.key = SecureRandom.urlsafe_base64
  end

  def create
    @judge_server = JudgeServer.new(judge_server_params)
    respond_to do |format|
      if @judge_server.save
        format.html { redirect_to @judge_server, notice: 'Judge Server was successfully created.' }
        format.json { render action: 'show', status: :created, location: @judge_server }
      else
        format.html { render action: 'new' }
        format.json { render json: @judge_server.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @judge_server.update(judge_server_params)
        format.html { redirect_to @judge_server, notice: 'Judge Server was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @judge_server.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @judge_server.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.html {redirect_to judge_servers_url}
    end 

  end

  private

  def set_judge_server
    @judge_server = JudgeServer.find(params[:id])
  end

  def judge_server_params
    params.require(:judge_server).permit(:id, :name, :key, :ip)
  end

  def authenticate_admin!
    authenticate_user!
    if current_user.admin == false
      redirect_to root_path
    end
  end
end
