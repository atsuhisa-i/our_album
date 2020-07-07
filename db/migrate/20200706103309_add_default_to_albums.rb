class AddDefaultToAlbums < ActiveRecord::Migration[5.2]
  def change
    change_column_null :albums, :group_id, false
    change_column_null :albums, :user_id, false
  end
end
