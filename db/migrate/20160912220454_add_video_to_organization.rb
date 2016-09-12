class AddVideoToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :video_url, :text
  end
end
