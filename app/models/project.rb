class Project < ApplicationRecord
  has_many :donations, dependent: :destroy

  validates :title, :description, :base_currency, presence: true
  validates :goal_amount, numericality: { greater_than: 0 }
  
  after_initialize :set_default_amount, if: :new_record?

  private

  def set_default_amount
    self.current_amount ||= 0.0
  end
end