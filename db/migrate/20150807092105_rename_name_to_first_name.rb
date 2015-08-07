class RenameNameToFirstName < ActiveRecord::Migration
  def change
    rename_column :profiles, :name, :first_name
    rename_column :profiles, :username, :last_name
  end
end
