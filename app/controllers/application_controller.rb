class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  def newsapi
    newsapi = News.new("840742eb9a874490b37a04e08b45c848")
    @top_headlines = newsapi.get_top_headlines(language: 'en')
  end

  before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

end
