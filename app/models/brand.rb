class Brand < User
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2 }
  validates :slogan, presence: true, length: { minimum: 2 }
  validates :cnpj, presence: true
end
