class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :organization, index: true, foreign_key: true
      t.date :date
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
