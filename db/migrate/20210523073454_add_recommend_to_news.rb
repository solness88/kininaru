class AddRecommendToNews < ActiveRecord::Migration[5.2]
  def change
    add_column  :news, :recommend, :boolean, default: false, null: false
  end
end
