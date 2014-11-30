class AddMatchDateToMatchRequest < ActiveRecord::Migration
  def change
    add_column :match_requests, :match_date, :date
  end
end
