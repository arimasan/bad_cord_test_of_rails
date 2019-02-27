class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    articles = Article.open.includes(:category)
    @articles = Article.search_articles(articles, params)
    @categories = Category.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
  end

  def edit
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.destroy
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :body,
      :status,
      :category_id,
      :user_id,
    )
  end

end
