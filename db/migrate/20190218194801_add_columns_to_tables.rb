class AddColumnsToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :athletes, :user, foreign_key: true
    add_reference :brands, :user, foreign_key: true
  end
end
