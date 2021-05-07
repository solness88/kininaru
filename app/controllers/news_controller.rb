class NewsController < ApplicationController
  before_action :newsapi

  def index
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
