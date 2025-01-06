class LikesController < ApplicationController
  before_action :find_likeable, only: [:create]

  def create
    @like = @likeable.likes.find_or_initialize_by(user: current_user)
    @like.save if @like.new_record?

    respond_to do |format|
      format.turbo_stream
    end
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
