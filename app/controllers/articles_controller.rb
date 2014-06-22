class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.where("era = ?", get_era).order("id DESC").page(params[:page])
  end
  
  def create
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index', notice: 'Insufficient User Permissions.'    
    end
    @article = Article.new(article_params)
    @article.arthur_id = current_user.id
    @article.era = get_era
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def new
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index', notice: 'Insufficient User Permissions.'    
    end
    @article = Article.new
  end
  
  def edit
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index', notice: 'Insufficient User Permissions.'    
    end
  end
  
  def show
    
  end
  
  def update
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index', notice: 'Insufficient User Permissions.'    
    end
    @article.arthur_id = current_user.id
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def destroy
    authenticate_user!
    if current_user.admin == false 
      redirect_to action:'index', notice: 'Insufficient User Permissions.'    
    end
    @article.destroy
    redirect_to articles_path
  end
  
private

  def get_era
     params[:era] ? params[:era] : 2014
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(
      :id,
      :title,
      :content,
      :page,
      attachments_attributes:
      [
        :id,
        :path,
        :_destroy
      ]
    )
  end
  
end
