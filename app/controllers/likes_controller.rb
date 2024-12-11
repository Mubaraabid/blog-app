class LikesController < ApplicationController
  before_action :find_likeable, only: [:create, :destroy]

  def create
    @like = @likeable.likes.find_or_initialize_by(user: current_user)

    if @like.new_record?
      @like.save
      @likeable.update_like_count
    end

    redirect_to @likeable
  end

  def destroy
    @like = @likeable.likes.find_by(id: params[:id], user: current_user)
    if @like
      @like.destroy
      @likeable.update_like_count
    end

    redirect_to @likeable
  end

  private

  def find_likeable
    if params[:article_id]
      @likeable = Article.find(params[:article_id])
    elsif params[:comment_id]
      @likeable = Comment.find(params[:comment_id])
    end
  end
end








