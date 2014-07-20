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
    
    redirect_to :back
    return
    
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
        return
      elsif @problem.visible_state == 1
        if params[:contest_id].blank?
          redirect_to action:'index'
          return
        end
	contest = Contest.find(params[:contest_id])
        unless contest.problem_ids.include?(@problem.id) and Time.now >= contest.start_time and Time.now <= contest.end_time
          redirect_to problem_path(@problem), notice: 'Contest ended, cannot submit.'
          return
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
    if params[:contest_id]
      @submissions = @submissions.where("contest_id = ?", params[:contest_id])
      unless user_signed_in? and current_user.admin?
        if Time.now <= @contest.end_time #and Time.now >= @contest.start_time
          #only self submission
          if user_signed_in?
            @submissions = @submissions.where("user_id = ?", current_user.id)
          else
            @submissions = @submissions.where("user_id = 0")
          end
        end
      end
    else
      #unless user_signed_in? and current_user.admin?
        @submissions = @submissions.where("contest_id is NULL")
      #end
    end
    @submissions = @submissions.where("problem_id = ?", params[:filter_problem]) if not params[:filter_problem].blank?
    @submissions = @submissions.joins("INNER JOIN users ON submissions.user_id = users.id").where("users.nickname LIKE ?", params[:filter_user]) if not params[:filter_user].blank?
    @submissions = @submissions.where("user_id = ?", params[:filter_user_id]) if not params[:filter_user_id].blank?
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
    @submission = Submission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def submission_params
    params.require(:submission).permit(:code, :compiler, :result, :score, :problem_id, :page)
  end
end
