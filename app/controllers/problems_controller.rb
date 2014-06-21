class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  def index
    @problems = Problem.all.order("id ASC").page(params[:page]).per(100)
  end

  def show
    if user_signed_in? && current_user.admin == true
    elsif @problem.visible_state == 0 
    elsif @problem.visible_state == 1 
      @contests = @problem.contests.all
      @during_contest = false
      @contests.each do |c|
	if Time.now >= c.start_time && Time.now <= c.end_time
	  @during_contest = true
	end
      end
      if @during_contest == false
	redirect_to action:'index'
      end
    else
      redirect_to action:'index'
    end
    @contest_id = params[:contest_id]
  end

  def new
		authenticate_user!
		if current_user.admin == false 
			redirect_to action:'index'
		end
		@problem = Problem.new
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
    @problem = Problem.new(problem_params)
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @problem }
      else
        format.html { render action: 'new' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index', notice: 'Insufficient User Permissions.'	
	end
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    redirect_to action:'index'
    # 'Deletion of problem may cause unwanted paginate behavior.'
    
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index'	
	end
    #@problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Deletion of problem may cause unwanted paginate behavior.' }
      format.json { head :no_content }
    end
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(
        :id, 
        :name, 
        :description, 
        :input, 
        :output, 
        :example_input,
        :example_output,
        :hint, 
        :source, 
        :limit, 
        :page,
	:visible_state
      )
    end
end
