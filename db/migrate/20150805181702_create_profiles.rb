class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :earnings
      t.references :user, index: true, foreign_key: true
      t.boolean :public

      t.timestamps null: false
    end
  end
end
