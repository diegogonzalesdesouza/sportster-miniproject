class AddProfilePhotoToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :profile_photo, :string
  end
end
