class LimitsController < ApplicationController
  before_action :set_limit, only: [:show, :edit, :update, :destroy]

  # GET /limits
  # GET /limits.json
  def index
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @limits = Limit.all
  end

  # GET /limits/1
  # GET /limits/1.json
  def show
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
  end

  # GET /limits/new
  def new
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @limit = Limit.new
  end

  # GET /limits/1/edit
  def edit
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
  end

  # POST /limits
  # POST /limits.json
  def create
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @limit = Limit.new(limit_params)

    respond_to do |format|
      if @limit.save
        format.html { redirect_to @limit, notice: 'Limit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @limit }
      else
        format.html { render action: 'new' }
        format.json { render json: @limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /limits/1
  # PATCH/PUT /limits/1.json
  def update
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    respond_to do |format|
      if @limit.update(limit_params)
        format.html { redirect_to @limit, notice: 'Limit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /limits/1
  # DELETE /limits/1.json
  def destroy
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @limit.destroy
    respond_to do |format|
      format.html { redirect_to limits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_limit
      @limit = Limit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def limit_params
      params.require(:limit).permit(:time, :memory, :output)
    end
end
