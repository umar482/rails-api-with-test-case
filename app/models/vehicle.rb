class Vehicle < ApplicationRecord
    has_many :reservations, dependent: :destroy
    belongs_to :make
end
