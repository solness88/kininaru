class NewsController < ApplicationController
  def index
    #require 'news-api'
    newsapi = News.new("840742eb9a874490b37a04e08b45c848")
    @top_headlines = newsapi.get_top_headlines(language: 'en')
  end

  def create
    New.create(title: params[:title], link: params[:link], image: params[:image])
    redirect_to news_index_path
  end
end
