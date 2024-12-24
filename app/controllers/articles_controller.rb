class ArticlesController < ApplicationController
  before_action :set_articles
  
  def index
    respond_to do |format|
      format.html
    end
  end

  def artlist
  end

  def show
    @article = Article.find(params[:id])
   
  end

  def new
    @article = Article.new
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

  def preview
  @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
     authorize @article
     
    if @article.update(article_params)
     redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :image)
    end

    def set_articles
      @articles = Article.order(created_at: :desc).page(params[:page])
    end
  end
