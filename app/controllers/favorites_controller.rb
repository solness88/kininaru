class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(new_id: params[:new_id])
    redirect_to news_index_path, notice: "#{favorite.new.user.name}さんの気になるニュースをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to news_index_path, notice: "#{favorite.new.user.name}さんの気になるニュースをお気に入り解除しました"
  end

end
