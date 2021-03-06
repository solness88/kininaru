class UsersController < ApplicationController
  before_action :articlesapi
  skip_before_action :login_required, only: [:new, :show, :edit, :update, :destroy, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end
  def show
    sleep 0.6
    @user = User.find(params[:id])
    @user_articles = Article.where(user_id: @user.id)
    @favorite_articles = @user.favorite_articles
    @recommend_articles =  Article.where(user_id: @user.id, recommend: true)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice:"ユーザーを削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :admin)
  end

end
