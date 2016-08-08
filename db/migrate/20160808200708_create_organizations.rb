class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.integer :school_admin_id
      t.string :school_origin

      t.timestamps null: false
    end
  end
end
