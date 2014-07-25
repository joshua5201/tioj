class ProblemsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :set_problem, only: [:show, :edit, :update, :destroy, :ranklist]

  def ranklist
    @submissions = @problem.submissions.where("contest_id is NULL AND result = ?", "AC").order("total_time ASC").order("total_memory ASC").order("LENGTH(code) ASC")
    set_page_title "Ranklist - " + @problem.id.to_s + " - " + @problem.name
  end
  
  def index
    if not params[:search_id].blank?
      redirect_to problem_path(params[:search_id])
      return
    end
    if not params[:search_name].blank?
      @problems = Problem.where("name LIKE ?", "%%%s%%"%params[:search_name]).page(params[:page]).per(100)
    elsif not params[:tag].blank?
      @problems = Problem.tagged_with(params[:tag]).order("id ASC").page(params[:page]).per(100)
    else
      @problems = Problem.all.order("id ASC").page(params[:page]).per(100)
    end
    set_page_title "Problems"
  end

  def show
    unless user_signed_in? && current_user.admin == true
      if @problem.visible_state == 1 
        if params[:contest_id].blank?
          redirect_to action:'index'
          return
        end
        contest = Contest.find(params[:contest_id])
        unless contest.problem_ids.include?(@problem.id) and Time.now >= contest.start_time and Time.now <= contest.end_time
          redirect_to action:'index'
          return
        end
      elsif @problem.visible_state == 2
        redirect_to action:'index'
        return
      end
    end
    @contest_id = params[:contest_id]
    set_page_title @problem.id.to_s + " - " + @problem.name
  end

  def new
    @problem = Problem.new
    set_page_title "New problem"
  end

  def edit
    set_page_title "Edit " + @problem.id.to_s + " - " + @problem.name
  end

  def create
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
    return
    # 'Deletion of problem may cause unwanted paginate behavior.'
    
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
	:visible_state,
        :tag_list,
        :problem_type,
        :sjcode,
        :interlib,
	testdata_sets_attributes:
	[
	  :id,
	  :from,
	  :to,
	  :score,
	  :_destroy
        ]
      )
    end
end
