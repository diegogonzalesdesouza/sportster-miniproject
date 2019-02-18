class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :cpf

      t.timestamps
    end
  end
end
