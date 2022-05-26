# frozen_string_literal: true

class CreateTemperatureReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :temperature_readings do |t|
      t.references :user, null: false, foreign_key: true
      t.float :body_temp
      t.float :actual_temp

      t.timestamps
    end
  end
end
