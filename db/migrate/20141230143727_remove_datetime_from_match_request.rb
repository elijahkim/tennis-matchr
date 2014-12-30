class RemoveDatetimeFromMatchRequest < ActiveRecord::Migration
  def change
    remove_column :match_requests, :start_date, :datetime
    remove_column :match_requests, :end_date, :datetime
    change_column_null :match_requests, :match_at, true
  end
end
