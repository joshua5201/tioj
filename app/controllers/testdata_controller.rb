class TestdataController < ApplicationController
  before_action :set_testdatum, only: [:show, :edit, :update, :destroy]
  before_action :find_problem

  # GET /testdata
  # GET /testdata.json
  def index
    @testdata = @problem.testdata
  end

  # GET /testdata/1
  # GET /testdata/1.json
  def show
  end

  # GET /testdata/new
  def new
    @testdatum = @problem.testdata.build 
  end

  # GET /testdata/1/edit
  def edit
  end

  # POST /testdata
  # POST /testdata.json
  def create
    @testdatum = Testdatum.new(testdatum_params)

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

  # PATCH/PUT /testdata/1
  # PATCH/PUT /testdata/1.json
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

  # DELETE /testdata/1
  # DELETE /testdata/1.json
  def destroy
    @testdatum.destroy
    respond_to do |format|
      format.html { redirect_to testdata_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
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
