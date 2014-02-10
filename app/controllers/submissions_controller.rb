class SubmissionsController < ApplicationController
  before_action :set_submissions
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    @submissions = @submissions.order("updated_at DESC")
  end

  def show
  end

  def new
    @submission = @submissions.build
  end

  def edit
  end

  def create
    @submission = @submissions.build(submission_params)

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
      @submissions = @problem ? @problem.submissions : Submission.all
    end
    
    def set_submission
      @submission = @submissions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:code, :compiler, :result, :score, :problem_id)
    end
end
