class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  has_many :donations, dependent: :nullify

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  after_initialize :set_default_currency, if: :new_record?

  private

  def set_default_currency
    self.preferred_currency ||= 'PEN' # Por defecto en Soles peruanos
  end
end