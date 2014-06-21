class TestdataController < ApplicationController
  before_action :find_problem, except: [:index_all]
  before_action :set_testdatum, only: [:show, :edit, :update, :destroy]

  def index
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @testdata = @problem.testdata
  end

  def index_all
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @testdata = Testdatum.all
  end
  def show
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
  end

  def new
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @testdatum = @problem.testdata.build
    @testdatum.build_limit
  end

  def edit
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    if not @testdatum.limit
      @testdatum.build_limit
    end
  end

  def create
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @testdatum = @problem.testdata.build(testdatum_params)

    respond_to do |format|
      if @testdatum.save
        format.html { redirect_to problem_testdata_path(@problem), notice: 'Testdatum was successfully created.' }
        format.json { render action: 'show', status: :created, location: prob_td_path(@problem, @testdatum) }
      else
        format.html { render action: 'new' }
        format.json { render json: @testdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
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
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
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

    def find_problem
      @problem = Problem.find(params[:problem_id])
    end

    def prob_td_path(prob, td)
      problem_testdatum_path(prob, td)
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
