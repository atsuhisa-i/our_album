class AddTitleToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :title, :string, null: false
  end
end
