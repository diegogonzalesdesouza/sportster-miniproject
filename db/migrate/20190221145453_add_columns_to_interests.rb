class AddColumnsToInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :athlete_interest, :boolean, default: false
    add_column :interests, :brand_interest, :boolean, default: false
  end
end
