class AddCoverPhotoToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :cover_photo, :string
  end
end
