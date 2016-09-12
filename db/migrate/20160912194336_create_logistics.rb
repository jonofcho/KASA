class CreateLogistics < ActiveRecord::Migration
  def change
    create_table :logistics do |t|
      t.string :meeting_location
      t.date :next_meeting
      t.string :time
      t.references :organization, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
