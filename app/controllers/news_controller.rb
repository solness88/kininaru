class NewsController < ApplicationController
  def index
    #require 'news-api'
    newsapi = News.new("840742eb9a874490b37a04e08b45c848")
    @top_headlines = newsapi.get_top_headlines(language: 'en')

    @news = New.all
  end

  def create
    New.create(news_params)
    redirect_to news_index_path
  end

  def show
  end

  private
  def news_params
    params.permit(:title, :link, :image)
  end

end
