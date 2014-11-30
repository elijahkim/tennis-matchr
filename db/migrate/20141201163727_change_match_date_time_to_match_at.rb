class ChangeMatchDateTimeToMatchAt < ActiveRecord::Migration
  def change
    remove_column :match_requests, :match_time
    add_column :match_requests, :match_at, :datetime
  end
end
