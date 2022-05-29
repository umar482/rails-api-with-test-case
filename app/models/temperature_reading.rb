# frozen_string_literal: true

class TemperatureReading < ApplicationRecord
  belongs_to :user
  
  validates :body_temp, presence: true, numericality: { only_float: true }, inclusion: { in: 0..100 }
  validates :actual_temp, presence: true, numericality: { only_float: true }, inclusion: { in: 0..100 }
end
