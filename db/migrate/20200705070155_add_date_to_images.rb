class AddDateToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :date, :date
  end
end
