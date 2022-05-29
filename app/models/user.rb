# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :gear

  has_many :temperature_readings
end
