class AddAttachmentAvatar3ToOrganizations < ActiveRecord::Migration
  def self.up
    change_table :organizations do |t|

      t.attachment :avatar3

    end
  end

  def self.down

    remove_attachment :organizations, :avatar3

  end
end
