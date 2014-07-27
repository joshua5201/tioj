class SubmissionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_admin!, except: [:index, :show, :create, :new]
  before_action :set_submissions
  before_action :set_submission, only: [:rejudge, :show, :edit, :update, :destroy]
  before_filter :set_contest, only: [:show]
  layout :set_contest_layout, only: [:show, :index, :new]
  
  def rejudge_problem
    Submission.where("problem_id = ?", params[:problem_id]).update_all(:result => "queued", :score => 0, :_result => "", :total_time => nil, :total_memory => nil)
    redirect_to :back
  end
  
  def rejudge
    @submission.update(:result => "queued", :score => 0, :_result => "", :total_time => nil, :total_memory => nil)
    redirect_to :back
  end
  
  def index
    @submissions = @submissions.order("id DESC").page(params[:page])
    set_page_title "Submissions"
  end

  def show
    unless (user_signed_in? and current_user.admin?) or (user_signed_in? and current_user.id == @submission.user_id)
      if @submission.contest && Time.now >= @submission.contest.start_time && Time.now <= @submission.contest.end_time
        if (not user_signed_in?) or (user_signed_in? and current_user.id != @submission.contest.user_id)
          redirect_to contest_path(@submission.contest), :notice => 'Submission is censored during contest.'
          return
        end
      end
    end
    @_result = @submission._result.to_s.split("/")
    set_page_title "Submission - " + @submission.id.to_s
  end

  def new
    if params[:problem_id].blank?
      redirect_to action:'index'
      return
    end
    unless current_user.admin?
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
    @submission = Submission.new
    @contest_id = params[:contest_id]
    set_page_title "New Submission - " + @problem.id.to_s + " - " + @problem.name
  end
  
  def create
    last_submission = Submission.where("user_id = ?", current_user.id).order("id Desc").first
    if not last_submission.blank? and (Time.now - last_submission.created_at) < 15
      redirect_to submissions_path, alert: 'CD time 15 seconds.'
      return
    end
    
    if params[:problem_id].blank?
      redirect_to action:'index'
      return
    end
    unless current_user.admin?
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

  def edit
    set_page_title "Edit submission - " + @submission.id.to_s
  end
  
  def update
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
            @submissions = @submissions.where("id = 0") #just make it a empty set whatsoever
            return
          end
        end
      end
    else
      #unless user_signed_in? and current_user.admin?
        @submissions = @submissions.where("contest_id is NULL")
      #end
    end
    @submissions = @submissions.where("problem_id = ?", params[:filter_problem]) if not params[:filter_problem].blank?
    @submissions = @submissions.joins("INNER JOIN users ON submissions.user_id = users.id").where("users.username LIKE ?", params[:filter_username]) if not params[:filter_username].blank?
    @submissions = @submissions.where("user_id = ?", params[:filter_user_id]) if not params[:filter_user_id].blank?
    @submissions = @submissions.where(result: params[:filter_status]) if not params[:filter_status].blank?
  end
  
  def set_submission
    @submission = Submission.find(params[:id])
  end
  
  def set_contest
    @contest = @submission.contest
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def submission_params
    params.require(:submission).permit(:code, :compiler, :problem_id)
  end
end
