class SubmissionsController < ApplicationController
  before_action :set_submissions
  before_action :set_submission, only: [:rejudge, :show, :edit, :update, :destroy]
  
  def rejudge_problem
    Submission.where("problem_id = ?", params[:problem_id]).update_all(:result => "queued", :score => 0, :_result => "", :total_time => nil, :total_memory => nil)
    redirect_to problem_path(params[:problem_id])
  end
  
  def rejudge
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'
      return
    end
    @submission.update(:result => "queued", :score => 0, :_result => "", :total_time => nil, :total_memory => nil)
    
    if params[:page]
      redirect_to :action => :index, :page => params[:page]
      return
    else
      redirect_to :action => :show
      return
    end
  end
  
  def index
    @submissions = @submissions.order("id DESC").page(params[:page])
  end

  def show
    @_result = @submission._result.to_s.split("/")
  end

  def new
    authenticate_user!
    if not params[:problem_id]
      redirect_to action:'index'
    end
    authenticate_user!
    if current_user.admin == false 
      if @problem.visible_state == 2
        redirect_to action:'index'
      elsif @problem.visible_state == 1
	@during_contest = false
	@problem.contests.each do |c|
	  if Time.now >= c.start_time && Time.now <= c.end_time
	    @during_contest = true
	  end
	end
	if @during_contest == false
	  redirect_to action:'index'
	end
      end
    end
    #@submission = @submissions.build
    @submission = Submission.new
    @contest_id = params[:contest_id]
  end

  def edit
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
  end

  def create
    authenticate_user!
    last_submission = Submission.where("user_id = ?", current_user.id).order("id Desc").first
    if not last_submission.blank? and (Time.now - last_submission.created_at) < 15
      redirect_to submissions_path, alert: 'CD time 15 seconds.'
      return
    end
    
    #@submission = @submissions.build(submission_params)
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    @submission.problem_id = params[:problem_id]
    if params[:contest_id]
      @contest = Contest.find(params[:contest_id]) 
      if @contest.problem_ids.include?(@submission.problem_id) and Time.now >= @contest.start_time and Time.now <= @contest.end_time
        @submission.contest_id = @contest.id
      end
    end
    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @submission }
      else
        format.html { render action: 'new' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'
      return
    end
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end

  private
    def set_submissions
      @problem = Problem.find(params[:problem_id]) if params[:problem_id]
      @contest = Contest.find(params[:contest_id]) if params[:contest_id]
      @submissions = Submission.all
      @submissions = @submissions.where("problem_id = ?", params[:problem_id]) if params[:problem_id]
      @submissions = @submissions.where("contest_id = ?", params[:contest_id]) if params[:contest_id]
      @submissions = @submissions.joins("INNER JOIN users ON submissions.user_id = users.id").where("users.nickname LIKE ?", params[:filter_user]) if not params[:filter_user].blank?
      @submissions = @submissions.where("problem_id = ?", params[:filter_problem]) if not params[:filter_problem].blank?
      @submissions = @submissions.where(result: params[:filter_status]) if not params[:filter_status].blank?
      #if @problem
	#@submissions = @problem.submissions
      #elsif @contest
	#@submissions = @contest.submissions
      #else
	#@submissions = Submission.all
      #end
    end
    
    def set_submission
      @submission = @submissions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:code, :compiler, :result, :score, :problem_id, :page)
    end
end
