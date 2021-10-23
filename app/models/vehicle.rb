class Vehicle < ApplicationRecord
    has_many :reservations, dependent: :destroy
    belongs_to :make
    validates :model, presence: true, length: { minimum: 2 }
end
