class SessionsController < ApplicationController
  before_action :newsapi
  skip_before_action :login_required, only: [:new, :create, :adminguest, :guest]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      sleep 0.6
      redirect_to users_path
    else
      flash.now[:danger] = 'ログインに失敗しました'
      sleep 0.6
      render :new
    end
  end

  def adminguest
    user = User.find_by(email: "admin-guest@admin-guest.com")
    session[:user_id] = user.id
    sleep 0.6
    redirect_to users_path
  end


  def guest
    user = User.find_by(email: "guest@guest.com")
    session[:user_id] = user.id
    sleep 0.6
    redirect_to users_path
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    sleep 0.6
    redirect_to new_session_path
  end

end
