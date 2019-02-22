class Brand < ApplicationRecord
  belongs_to :user
  has_many :athletes, through: :interests

  validates :name, presence: true, length: { minimum: 2 }
  validates :slogan, presence: true, length: { minimum: 2 }
  validates :cnpj, presence: true

  mount_uploader :profile_photo, PhotoUploader

  def is_interested?(brand, athlete)
    @interest = Interest.where(brand: brand, athlete: athlete).first

    if @interest.nil?
      false
    else
      @brand_interest = @interest.brand_interest
    end

  end
end
