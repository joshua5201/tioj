class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy, :dashboard]
  
  def dashboard
    if @contest.contest_type == 1
      authenticate_user!
      if not current_user.admin?
        redirect_to action:'index'
      end
    end
    @tasks = @contest.contest_problem_joints.order("id ASC").map{|e| e.problem}
    c_submissions = @contest.submissions#Submission.where("created_at >= ? AND created_at <= ? AND contest_id = ?", @contest.start_time, @contest.end_time, @contest.id)
    @submissions = []
    @participants = []
    @tasks.each_with_index do |task, index|
      @submissions << c_submissions.where("problem_id = ?", task.id)#select{|a| a.problem_id == task.id}
      @participants = @participants | @submissions[index].map{|e| e.user_id}
    end
    @scores = []
    if @contest.contest_type == 2
      #penalty
      @participants.each do |u|
        t = []
        total_attm = 0
        total_solv = 0
        penalty = 0
        (0..(@tasks.size-1)).each do |index|
          succ = @submissions[index].select{|a| a.user_id == u and a.result == 'AC'}.min_by{|a| a.id}
          if succ
            attm = @submissions[index].select{|a| a.user_id == u and a.id < succ.id}.size
            t << [attm+1, (succ.created_at - @contest.start_time).to_i / 60]
            total_solv += 1
            total_attm += attm+1
            penalty += attm * 20
          else
            attm = @submissions[index].select{|a| a.user_id == u}.size
            t << [attm, 0]
            total_attm += attm
          end
        end
        @scores << [u, total_attm, total_solv, t, t.map{|a| a[1]}.sum + penalty]
      end
      @scores = @scores.sort{|a, b| a[2] != b[2] ? -(a[2] <=> b[2]) : a[4] <=> b[4]}
      @color = @scores.map{|a| a[2]}.uniq.sort{|a| -a}
      @color << 0
    else
      @participants.each do |u|
        t = []
        (0..(@tasks.size-1)).each do |index|
          if @submissions[index].select{|a| a.user_id == u}.empty?
            t << 0
          else
            t << @submissions[index].select{|a| a.user_id == u}.max_by{|a| a.score}.score
          end
        end
        @scores << [u, t, t.sum]
      end
      @scores = @scores.sort_by{|a| -a[2]}
      @color = @scores.map{|a| a[2]}.uniq.sort{|a| -a}
      @color << 0
    end
  end
  
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
