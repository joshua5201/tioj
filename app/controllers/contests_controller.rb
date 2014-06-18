class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  def index
    @contests = Contest.all.order("id DESC").page(params[:page])
  end

  def show
    
  end

  def new
		authenticate_user!
		if current_user.admin == false 
			redirect_to action:'index'
		end
		@contest = Contest.new
		3.times { @contest.contest_problem_joints.build }
  end

  def edit
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index'	
	end
  end

  def create
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index'	
	end
    @contest = Contest.new(contest_params)
    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contest }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index', notice: 'Insufficient User Permissions.'	
	end
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index'	
	end
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url }
      format.json { head :no_content }
    end
  end

  private
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit(
	:id,
	:title,
	:description,
      	:start_time,
	:end_time,
	:contest_type,
        :page,
	contest_problem_joints_attributes: 
        [
	    :id,
            :problem_id,
	    :_destroy
        ]
      )
    end
end
