class DefaultValueForEarnings < ActiveRecord::Migration
  def change
    change_column :profiles, :earnings, :integer, default: 0
  end
end
