class RenameFromNewIdToArticleIdOnFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :new_id, :article_id
  end
end
