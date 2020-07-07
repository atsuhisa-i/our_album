class RemovePictureFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :picture, :string
  end
end
