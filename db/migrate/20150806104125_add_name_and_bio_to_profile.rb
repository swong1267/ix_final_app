class AddNameAndBioToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :bio, :string
  end
end
