class UsersController < ApplicationController
  before_action :newsapi
  def index
  end

  def new
    @user = User.new
  end

  def create
  end
end
