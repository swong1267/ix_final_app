class RemoveAvatarFileSizeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :avatar_file_size, :integer
  end
end
