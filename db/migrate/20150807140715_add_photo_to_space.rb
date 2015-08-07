class AddPhotoToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :photo, :string
  end
end
