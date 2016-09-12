class LogisticChangeNextMeetingType < ActiveRecord::Migration
  def change
    change_column(:logistics, :next_meeting, :text)
  end
end
