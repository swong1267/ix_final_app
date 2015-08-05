class RemoveAvatarContentTypeFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :avatar_content_type, :string
  end
end
