class AddImageUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string, default: "http://bit.ly/11UlaV5"
    add_column :users, :location, :string
  end
end
