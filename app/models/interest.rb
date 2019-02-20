class Interest < ApplicationRecord
  belongs_to :athlete
  belongs_to :brand

  validates :athlete_id, uniqueness: { scope: :brand_id }
end
