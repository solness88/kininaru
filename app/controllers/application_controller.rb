class ApplicationController < ActionController::Base

  def newsapi
    newsapi = News.new("840742eb9a874490b37a04e08b45c848")
    @top_headlines = newsapi.get_top_headlines(language: 'en')
  end

end
