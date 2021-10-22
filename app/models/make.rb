class Make < ApplicationRecord
  has_many :vehicles, dependent: :destroy
end
