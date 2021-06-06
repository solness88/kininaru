class Admin::UsersController < ApplicationController

  before_action :articlesapi
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]

  def index
    if current_user.admin == false
      redirect_to articles_path, notice: "管理者ページの閲覧には管理者権限が必要です"
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice:"ユーザーを削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
