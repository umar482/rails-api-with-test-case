class Customer < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :email, format: { with: Devise.email_regexp }

end


