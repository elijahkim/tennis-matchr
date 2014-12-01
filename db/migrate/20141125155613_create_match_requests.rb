class CreateMatchRequests < ActiveRecord::Migration
  def change
    create_table :match_requests do |t|
      t.integer :requester_id, index: true
      t.integer :opponent_id, index: true
      t.text :request_message, null: false
      t.date :start_date
      t.date :end_date
      t.datetime :match_date_time
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end
  end
end
