class Make < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end
