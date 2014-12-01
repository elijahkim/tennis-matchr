class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :challenger_id, index: true, null: false
      t.integer :opponent_id, index: true, null: false
      t.datetime :match_at

      t.timestamps
    end
  end
end
