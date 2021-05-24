class NewsController < ApplicationController
  before_action :newsapi
  before_action :set_new, only: [:destroy, :update]

  def index
    @news = New.all.order(id: "DESC")
    @news_length = @news.length
  end

  def create
    @new = New.create(news_params)
    redirect_to news_index_path
  end

  def update
    #@new.update(news_params)
    if @new.recommend == false
      @new.attributes = {recommend:true}
    else
      @new.attributes = {recommend:false}
    end
    @new.save
    redirect_to user_path(@new.user_id), notice: "おすすめニュースを更新しました！"
  end

  def destroy
    @new.destroy
    redirect_to news_index_path, notice:"気になるニュースを削除しました"
  end

  private

  def news_params
    params.require(:new).permit(:title, :link, :image, :user_id, :recommend)
  end

  def set_new
    @new = New.find(params[:id])
  end

end
