class CommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    time_comment = Time.now
    @comment.time_comment = time_comment.month.to_s + '.' + time_comment.day.to_s + ' at ' + time_comment.hour.to_s + ':' + time_comment.day.to_s
    
    @comment.save
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  
end
