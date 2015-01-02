class AddLocationToUser < ActiveRecord::Migration
  def change
    add_reference :users, :court
  end
end
