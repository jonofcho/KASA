class AddAttachmentAvatar2ToOrganizations < ActiveRecord::Migration
  def self.up
    change_table :organizations do |t|

      t.attachment :avatar2

    end
  end

  def self.down

    remove_attachment :organizations, :avatar2

  end
end
