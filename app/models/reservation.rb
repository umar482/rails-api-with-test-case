class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  accepts_nested_attributes_for :customer

  # Validators
  validates :date, presence: true
  validates :time, presence: true

end
