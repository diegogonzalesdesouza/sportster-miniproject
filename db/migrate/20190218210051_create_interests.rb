class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.references :athlete, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
