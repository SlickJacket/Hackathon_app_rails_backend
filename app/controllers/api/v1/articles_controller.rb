class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authorized
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all

    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :date_posted)
    end
end
