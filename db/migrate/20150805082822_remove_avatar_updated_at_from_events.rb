class RemoveAvatarUpdatedAtFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :avatar_updated_at, :datetime
  end
end
