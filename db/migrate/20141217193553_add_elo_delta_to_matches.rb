class AddEloDeltaToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :elo_delta, :integer
    change_column_null :matches, :defender_elo, true
    change_column_null :matches, :challenger_elo, true
  end
end
