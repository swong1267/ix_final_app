class RenameRequestToEvent < ActiveRecord::Migration
  def change
    rename_table :requests, :events
  end
end
