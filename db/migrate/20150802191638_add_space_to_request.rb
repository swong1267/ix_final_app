class AddSpaceToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :space, index: true, foreign_key: true
  end
end
