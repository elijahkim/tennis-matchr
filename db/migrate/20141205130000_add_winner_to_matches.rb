class AddWinnerToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :winner_id, :integer, index: true
  end
end
