class FavoritesController < ApplicationController
  #before_action :set_news, only: [:create, :destroy]

  def create
    favorite = current_user.favorites.create(new_id: params[:new_id])
    @new = New.find(params[:new_id])
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @delete_new = favorite.new
    #@new = New.find(params[:new_id])
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
  end

end
