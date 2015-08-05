class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :location
      t.integer :people
      t.string :category
      t.string :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
