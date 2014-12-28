class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id, null: false, index: true
      t.integer :subject_id, null: false, index: true
      t.string :subject_type, null: false, index: true
      t.string :name, null: false
      t.string :direction, null: false

      t.timestamps
    end
  end
end
