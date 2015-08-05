class RemoveAvatarUpdatedAtFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :avatar_updated_at, :datetime
  end
end
