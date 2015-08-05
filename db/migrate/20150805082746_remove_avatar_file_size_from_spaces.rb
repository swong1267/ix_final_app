class RemoveAvatarFileSizeFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :avatar_file_size, :integer
  end
end
