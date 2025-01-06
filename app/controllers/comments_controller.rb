class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :set_comment, only: [:destroy]
  before_action :set_article_id, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment

    @comment.save

    redirect_to article_path(@article_id)
  end

  def destroy
    @comment.destroy

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :articles_id)
  end

  def find_commentable
    if params[:article_id]
      @commentable = Article.find(params[:article_id])
    elsif params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
  end

  def set_article_id
    @article_id = params[:comment][:articles_id]
  end
end
