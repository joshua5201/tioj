class TestdataController < ApplicationController
  before_action :find_problem, except: [:index_all]
  before_action :set_testdatum, only: [:show, :edit, :update, :destroy]

  def index
    @testdata = @problem.testdata
  end

  def index_all
    @testdata = Testdatum.all
  end
  def show
  end

  def new
    @testdatum = @problem.testdata.build 
  end

  def edit
  end

  def create
    @testdatum = @problem.testdata.build(testdatum_params)

    respond_to do |format|
      if @testdatum.save
        format.html { redirect_to prob_td_path(@problem, @testdatum), notice: 'Testdatum was successfully created.' }
        format.json { render action: 'show', status: :created, location: prob_td_path(@problem, @testdatum) }
      else
        format.html { render action: 'new' }
        format.json { render json: @testdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @testdatum.update(testdatum_params)
        format.html { redirect_to prob_td_path(@problem, @testdatum), notice: 'Testdatum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @testdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @testdatum.destroy
    respond_to do |format|
      if params[:index_all] == '1'
        format.html {redirect_to '/testdata' }
      else
        format.html { redirect_to problem_testdatum_path(@problem) }
      end
      format.json { head :no_content }
    end
  end

  private
    def set_testdatum
      @testdatum = Testdatum.find(params[:id])
    end

    def find_problem
      @problem = Problem.find(params[:problem_id])
    end

    def prob_td_path(prob, td)
      problem_testdatum_path(prob, td)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def testdatum_params
      params.require(:testdatum).permit(:input, :answer, :problem_id)
    end
end
