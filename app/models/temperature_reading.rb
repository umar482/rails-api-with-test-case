# frozen_string_literal: true

class TemperatureReading < ApplicationRecord
  after_initialize :actual_temperature

  belongs_to :user

  # taking the range of body temperature between 0-100 degree centigrade for this exampel
  validates :body_temp, presence: true, numericality: { only_float: true, greater_than: 0, less_than: 100 }
  validates :actual_temp, presence: true, numericality: { only_float: true, greater_than: 0, less_than: 100 }

  def actual_temperature
    return if body_temp.nil? || user.nil?

    # body temperature calibration with offset value
    self.actual_temp = body_temp + user.gear.offset_value
  end
end
