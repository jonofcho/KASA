class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :grad_year, :integer
    add_column :users, :major, :string
    add_column :users, :current_employer, :string
    add_column :users, :current_position, :string
  end
end
