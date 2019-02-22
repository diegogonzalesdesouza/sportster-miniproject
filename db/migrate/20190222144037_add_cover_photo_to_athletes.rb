class AddCoverPhotoToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :cover_photo, :string
  end
end
