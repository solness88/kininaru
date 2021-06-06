class ApplicationController < ActionController::Base
  #before_action :articlesapi
  before_action :login_required, except:[:home]
  protect_from_forgery with: :exception
  include SessionsHelper
  require 'uri'
  require 'net/http'
  require 'openssl'
  require "json"

  def articlesapi
    sleep 1
    url = URI("https://free-news.p.rapidapi.com/v1/search?q=US China COVID Tech Biden&lang=en&page=1&page_size=25")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV['FreeNewsAPI_Key']
    request["x-rapidapi-host"] = 'free-news.p.rapidapi.com'
    response = http.request(request)
    @hash = JSON.parse(response.body)
  end

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

end
