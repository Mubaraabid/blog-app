class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user 
    authorize @comment

    if @comment.save
      redirect_to article_path(@commentable)
    else
      redirect_to article_path(@commentable), status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy

    redirect_to article_path(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:article_id]
      @commentable = Article.find(params[:article_id])  
    elsif params[:comment_id]
      @commentable = Comment.find(params[:comment_id]) 
    end
  end
end
 