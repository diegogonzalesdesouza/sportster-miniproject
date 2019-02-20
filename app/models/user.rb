class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :athlete, dependent: :destroy
  has_one :brand, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :address, presence: true
  validates :is_athlete, inclusion: { in: [true, false] }
end
