class RemoveNewsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :news,force: :cascade
  end
end
