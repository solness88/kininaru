class NewsController < ApplicationController
  before_action :newsapi
  before_action :set_new, only: [:destroy]

  def index
    @news = New.all
  end

  def create
    New.create(news_params)
    redirect_to news_index_path
  end

  def destroy
    @new.destroy
    redirect_to news_index_path, notice:"気になるニュースを削除しました"
  end

  private

  def news_params
    params.require(:new).permit(:title, :link, :image, :user_id)
  end

  def set_new
    @new = New.find(params[:id])
  end

end
