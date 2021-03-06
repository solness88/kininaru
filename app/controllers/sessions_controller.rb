class SessionsController < ApplicationController
  before_action :articlesapi
  skip_before_action :login_required, only: [:new, :create, :adminguest, :guest]

  def new
    if logged_in?
      redirect_to users_path 
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      sleep 0.6
      if user.admin == true
        redirect_to admin_users_path
      else
        redirect_to users_path
      end
    else
      flash.now[:danger] = 'ログインに失敗しました。メールアドレスとパスワードをご確認ください。'
      sleep 0.6
      render :new
    end
  end

  def adminguest
    user = User.find_by(email: "admin-guest@admin-guest.com")
    session[:user_id] = user.id
    sleep 0.6
    redirect_to admin_users_path
  end


  def guest
    user = User.find_by(email: "guest0@guest.com")
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
