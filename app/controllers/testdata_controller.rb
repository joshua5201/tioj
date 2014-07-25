class TestdataController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_problem
  before_action :set_testdatum, only: [:edit, :update, :destroy]

  def index
    @testdata = @problem.testdata
  end

  def new
    @testdatum = @problem.testdata.build
    @testdatum.build_limit
  end

  def edit
    if not @testdatum.limit
      @testdatum.build_limit
    end
  end

  def create
    @testdatum = @problem.testdata.build(testdatum_params)

    respond_to do |format|
      if @testdatum.save
        format.html { redirect_to problem_testdata_path(@problem), notice: 'Testdatum was successfully created.' }
        #format.json { render action: 'show', status: :created, location: prob_testdata_path(@problem, @testdatum) }
      else
        format.html { render action: 'new' }
        format.json { render json: @testdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @testdatum.update(testdatum_params)
        format.html { redirect_to problem_testdata_path(@problem), notice: 'Testdatum was successfully updated.' }
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
        format.html { redirect_to problem_testdata_path(@problem) }
      end
      format.json { head :no_content }
    end
  end

  private
  def set_testdatum
    @testdatum = Testdatum.find(params[:id])
  end

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def testdatum_params
    params.require(:testdatum).permit(:problem_id, :test_input, :test_output, 
      limit_attributes: 
        [
          :id, 
          :time, 
          :memory, 
          :output, 
          :problem_id,
          :testdatum_id
     ])
  end
end
