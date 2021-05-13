class NewsController < ApplicationController
  before_action :newsapi

  def index
    @news = New.all
  end

  def create
    New.create(news_params)
    redirect_to news_index_path
  end

  private

  def news_params
    params.require(:new).permit(:title, :link, :image, :user_id)
  end

end
