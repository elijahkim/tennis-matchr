class ChangeMatchTableOpponentToDefender < ActiveRecord::Migration
  def change
    rename_column :matches, :opponent_id, :defender_id
  end
end
