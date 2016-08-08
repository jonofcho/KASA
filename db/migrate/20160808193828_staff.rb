class Staff < ActiveRecord::Migration
  def change
    def change
    create_table :staff, :id => false do |t|
      t.integer :organization_id
      t.integer :user_id
    end
  end
  end
end
