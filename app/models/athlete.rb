class Athlete < ApplicationRecord
  belongs_to :user
  has_many :brands, through: :interests

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :cpf, presence: true


  mount_uploader :profile_photo, PhotoUploader

  def is_interested?(brand, athlete)
    @interest = Interest.where(brand: brand, athlete: athlete)
    if @interest == []
      false
    else
      true
    end
  end
end
