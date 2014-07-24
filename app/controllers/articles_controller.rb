class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :is_owner, only: [:edit,:update,:destroy]

  def new
    @article = Article.new                                                               
  end
  
  def create
    
    @article = current_user.articles.new(article_params)
    time = Time.new
    @article.time = time.month.to_s + '.' + time.day.to_s + '.' + time.year.to_s  + ' at ' + time.hour.to_s + ':' + time.min.to_s
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def is_owner
    @article = Article.find(params[:id])
    if (current_user!=@article.user)
      redirect_to @article
    end
  end
  
end
