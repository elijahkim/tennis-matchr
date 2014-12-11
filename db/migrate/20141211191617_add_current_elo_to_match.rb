class AddCurrentEloToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :challenger_elo, :integer, null: false
    add_column :matches, :defender_elo, :integer, null: false
    add_column :match_requests, :opponent_elo, :integer, null: false
    add_column :match_requests, :requester_elo, :integer, null: false

    change_column_null :match_requests, :requester_id, false
    change_column_null :match_requests, :opponent_id, false
    change_column_null :match_requests, :start_date, false
    change_column_null :match_requests, :end_date, false

    change_column_null :matches, :match_at, false
  end
end
