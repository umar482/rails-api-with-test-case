# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :gear

  has_many :temperature_readings

  # taking last 5 temperate readings as the decider for high temperature values
  # therefore using average formula here
  # i think average is a good choice here rather than mode or median, considering human body temperature
  def high_temperature?
    temperature_readings.order(id: :desc).limit(5).pluck(:actual_temp).sum / 5 >= 37.5
  end
end
