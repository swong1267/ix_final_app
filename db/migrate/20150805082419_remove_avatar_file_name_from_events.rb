class RemoveAvatarFileNameFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :avatar_file_name, :string
  end
end
