class Brand < ApplicationRecord
  belongs_to :user
  has_many :athletes, through: :interests

  validates :name, presence: true, length: { minimum: 2 }
  validates :slogan, presence: true, length: { minimum: 2 }
  validates :cnpj, presence: true
end
