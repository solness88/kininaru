class ArticlesController < ApplicationController
  before_action :articlesapi
  before_action :set_article, only: [:destroy, :update]

  def home
  end

  def index
    raise
    @articles = Article.all.order(id: "DESC")
    @articles_length = @articles.length
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def update
    if @article.recommend == false
      @article.attributes = {recommend:true}
    else
      @article.attributes = {recommend:false}
    end
    @article.save
    sleep 0.6
    redirect_to user_path(@article.user_id)
  end

  def destroy
    @article.destroy
    sleep 0.6
    redirect_to articles_path, notice: "気になるニュースを削除しました"
  end

  private

  def article_params
    params.require(:article).permit(:title, :link, :image, :user_id, :recommend)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
