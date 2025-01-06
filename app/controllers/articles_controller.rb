class ArticlesController < ApplicationController
  before_action :set_articles, only: %i[index articlelist]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    respond_to do |format|
      format.html
    end
  end

  def articlelist; end

  def show; end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = current_user.articles.new(article_params)
    authorize @article
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    authorize @article

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image, :crop_x, :crop_y, :crop_width, :crop_height)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_articles
    @articles = Article.order(created_at: :desc).page(params[:page])
  end
end
