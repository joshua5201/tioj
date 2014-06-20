class PostsController < ApplicationController
  before_action :set_posts

  # GET /posts
  # GET /posts.json
  def index
    @posts = @posts.order("updated_at DESC").page(params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @posts.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = @posts.build
  end

  # GET /posts/1/edit
  def edit
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @post = @posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @post = @posts.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index'	
    end
    @post = @posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_posts 
    @problem = Problem.find(params[:problem_id]) if params[:problem_id]
    @posts = @problem ? @problem.posts : Post.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(
      :title, 
      :content, 
      :user_id, 
      :problem_id,
      :page,
      comments_attributes: [
        :id,
        :title,
        :content,
        :post_id
      ]
    )
  end
end
