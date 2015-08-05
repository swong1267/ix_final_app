class RenameInquiriesToRequests < ActiveRecord::Migration
  def change
    rename_table :inquiries, :requests
  end
end
