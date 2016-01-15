class AddImageUrlToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :image_url, :string
  end
end
