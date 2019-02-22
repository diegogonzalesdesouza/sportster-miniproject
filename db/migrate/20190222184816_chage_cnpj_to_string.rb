class ChageCnpjToString < ActiveRecord::Migration[5.2]
  def change
    change_column :brands, :cnpj, :string
  end
end
