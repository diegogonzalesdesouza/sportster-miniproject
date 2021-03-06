class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :position
      t.date :date
      t.text :description
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
