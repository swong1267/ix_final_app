class AddPhotoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :photo, :string
    add_column :events, :string, :string
  end
end
