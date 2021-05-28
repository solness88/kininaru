class UsersController < ApplicationController
  before_action :newsapi
  skip_before_action :login_required, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end
  def show
    sleep 0.6
    @user = User.find(params[:id])
    @user_news = New.where(user_id: @user.id)
    @favorite_news = @user.favorite_news
    @recommend_news =  New.where(user_id: @user.id, recommend: true)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :admin)
  end

end
