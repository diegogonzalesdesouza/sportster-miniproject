class Athlete < ApplicationRecord
  belongs_to :user
  has_many :brands, through: :interests
  has_many :interests, dependent: :destroy

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :cpf, presence: true

  mount_uploader :profile_photo, PhotoUploader
  mount_uploader :cover_photo, PhotoUploader


  def is_interested?(brand, athlete)
    @interest = Interest.where(brand: brand, athlete: athlete).first

    if @interest.nil?
      false
    else
      @athlete_interest = @interest.athlete_interest
    end
  end
end
