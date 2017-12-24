class ProblemsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :set_problem, only: [:show, :edit, :update, :destroy, :ranklist]
  before_filter :set_contest, only: [:show]
  layout :set_contest_layout, only: [:show]
  
  def ranklist
    @submissions = @problem.submissions.where("contest_id is NULL AND result = ?", "AC").order("total_time ASC").order("total_memory ASC").order("LENGTH(code) ASC")
    set_page_title "Ranklist - " + @problem.id.to_s + " - " + @problem.name
  end
  
  def index
    if not params[:search_id].blank?
      redirect_to problem_path(params[:search_id])
      return
    end
    @problems = Problem.select("problems.*, count(distinct case when s.result = 'AC' then s.user_id end) user_ac, count(distinct s.user_id) user_cnt, count(case when s.result = 'AC' then 1 end) sub_ac, count(s.id) sub_cnt, bit_or(s.result = 'AC' and s.user_id = %d) cur_user_ac, bit_or(s.user_id = %d) cur_user_tried" % ([current_user ? current_user.id : 0]*2)).joins("left join submissions s on s.problem_id = problems.id and s.contest_id is NULL").group("problems.id")
    if not params[:search_name].blank?
      @problems = @problems.where("name LIKE ?", "%%%s%%"%params[:search_name])
    end
    if not params[:tag].blank?
      @problems = @problems.tagged_with(params[:tag])
    end

    @problems = @problems.order("problems.id ASC").page(params[:page]).per(100)
    set_page_title "Problems"
  end

  def show
    unless user_signed_in? && current_user.admin == true
      if @problem.visible_state == 1 
        if params[:contest_id].blank?
          redirect_to :back, :notice => 'Insufficient User Permissions.'
          return
        end
        unless @contest.problem_ids.include?(@problem.id) and Time.now >= @contest.start_time and Time.now <= @contest.end_time
          redirect_to :back, :notice => 'Insufficient User Permissions.'
          return
        end
      elsif @problem.visible_state == 2
        redirect_to :back, :notice => 'Insufficient User Permissions.'
        return
      end
    end
    #@contest_id = params[:contest_id]
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
    
    def set_contest
      @contest = Contest.find(params[:contest_id]) if not params[:contest_id].blank?
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
        :old_pid,
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
