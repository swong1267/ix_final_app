class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.integer :space_id
      t.integer :event_id
      t.string :body

      t.timestamps null: false
    end
    add_index :inquiries, :space_id
    add_index :inquiries, :event_id
  end
end
