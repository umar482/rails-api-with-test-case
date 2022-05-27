# frozen_string_literal: true

class TemperatureReading < ApplicationRecord
  belongs_to :user

  validates :body_temp, presence: true, numericality: { only_float: true }
  validates :actual_temp, presence: true, numericality: { only_float: true }
end
