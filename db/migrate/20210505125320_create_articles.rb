class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :link
      t.text :image
      t.references :user, foreign_key: true
      t.boolean :recommend, default: false, null: false
    end
  end
end
