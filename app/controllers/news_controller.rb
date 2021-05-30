class NewsController < ApplicationController
  before_action :newsapi
  before_action :set_new, only: [:destroy, :update]

  def home
  end

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
    sleep 0.6
    redirect_to user_path(@new.user_id)
  end

  def destroy
    @new.destroy
    sleep 0.6
    redirect_to news_index_path
  end

  private

  def news_params
    params.require(:new).permit(:title, :link, :image, :user_id, :recommend)
  end

  def set_new
    @new = New.find(params[:id])
  end

end
