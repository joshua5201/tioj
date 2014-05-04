class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  def index
    @problems = Problem.all.page(params[:page])
  end

  def show
    @limit = @problem.limit
  end

  def new
		authenticate_user!
		if current_user.admin == false 
			redirect_to action:'index'
		end
		@problem = Problem.new
		@limit = @problem.build_limit
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
	authenticate_user!
	if current_user.admin == false 
		redirect_to action:'index'	
	end
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url }
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
        limit_attributes: 
        [
            :id, 
            :time, 
            :memory, 
            :output, 
            :problem_id
        ]
      )
    end
end
