class ChangeImagesToAlbums < ActiveRecord::Migration[5.2]
  def change
    rename_table :images, :albums
  end
end
