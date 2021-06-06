class RenameFromNewIdToArticleIdOnComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :new_id, :article_id
  end
end
