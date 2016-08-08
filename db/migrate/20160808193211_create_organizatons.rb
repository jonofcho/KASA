class CreateOrganizatons < ActiveRecord::Migration
  def change
    create_table :organizatons do |t|
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :school_admin
      t.text :school_origin

      t.timestamps null: false
    end
  end
end
