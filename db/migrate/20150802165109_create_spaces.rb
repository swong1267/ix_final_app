class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :location
      t.integer :price

      t.timestamps null: false
    end
  end
end
