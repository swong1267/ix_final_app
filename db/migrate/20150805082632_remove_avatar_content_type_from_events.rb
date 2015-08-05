class RemoveAvatarContentTypeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :avatar_content_type, :string
  end
end
