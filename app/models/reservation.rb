class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  accepts_nested_attributes_for :customer, :reject_if => :check_customer

  # Validators
  validates :date, presence: true
  validates :time, presence: true

  protected

    def check_customer(customer_attr)
      return false unless new_record?
      if _customer = Customer.find_by(email: customer_attr[:email])
        self.customer = _customer
        return true
      end
    end
end
