class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "name", password: "pas", except: [:index, :show]     #Запрашивает логин и пас с которыми можно работать
  
  def new
    @article = Article.new                                                                #Создает новую таблицу
  end
  
  def create
    
    @article = Article.new(article_params)                                                #Создает создает новую если
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])                                                    #Редактирует стороку с данным ID
  end
  
  def update
    @article = Article.find(params[:id])        
 
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
  
end
