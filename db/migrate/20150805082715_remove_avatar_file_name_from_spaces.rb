class RemoveAvatarFileNameFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :avatar_file_name, :string
  end
end
