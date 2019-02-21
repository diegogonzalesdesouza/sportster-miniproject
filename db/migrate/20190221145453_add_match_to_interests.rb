class AddMatchToInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :match, :boolean, default: false
  end
end
