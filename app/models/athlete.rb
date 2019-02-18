class Athlete < ApplicationRecord
  belongs_to :user
  has_many :brands, through: :interests

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :cpf, presence: true
end
