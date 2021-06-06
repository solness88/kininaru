class FavoritesController < ApplicationController
  #before_action :set_news, only: [:create, :destroy]

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @delete_article = favorite.article
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
  end

end
