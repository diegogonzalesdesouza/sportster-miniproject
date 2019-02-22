class ChageCpfToString < ActiveRecord::Migration[5.2]
  def change
      change_column :athletes, :cpf, :string
  end
end
