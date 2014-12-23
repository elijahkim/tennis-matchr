class RemoveEloFromMatchRequest < ActiveRecord::Migration
  def change
    remove_column :match_requests, :opponent_elo
    remove_column :match_requests, :requester_elo
  end
end
