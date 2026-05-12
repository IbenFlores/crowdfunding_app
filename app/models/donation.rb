class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :user 

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :original_amount, presence: true, numericality: { greater_than: 0 }
  validates :original_currency, presence: true
  validates :transaction_code, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :donor_email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "debe ser un correo válido" }

  VALID_TX_CODE_REGEX = /\ADON-\d{5}[A-Z]\z/
  validates :transaction_code, format: { with: VALID_TX_CODE_REGEX, message: "debe tener el formato DON-12345A" }
end