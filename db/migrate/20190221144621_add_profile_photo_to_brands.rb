class AddProfilePhotoToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :profile_photo, :string
  end
end
