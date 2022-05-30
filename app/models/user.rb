# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :gear

  has_many :temperature_readings

  def high_temperature?
    temperature_readings.order(id: :desc).limit(5).pluck(:actual_temp).sum / 5 >= 37.5
  end
end
