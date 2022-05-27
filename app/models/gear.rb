# frozen_string_literal: true

class Gear < ApplicationRecord
  validates :offset_value, presence: true, numericality: { only_float: true }
end
