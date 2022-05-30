# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @gear = Gear.create(name: 'mi', offset_value: 1.3) }
  before(:each) { @user = User.create(name: 'ali', gear_id: @gear.id) }

  describe User do
    context 'user associations' do
      it 'should have many temperature readings' do
        temp_readings = User.reflect_on_association(:temperature_readings)
        expect(temp_readings.macro).to eq(:has_many)
      end

      it 'should belong to gear' do
        gear = User.reflect_on_association(:gear)
        expect(gear.macro).to eq(:belongs_to)
      end
    end
  end

  describe 'Check for high temperature' do
    context 'User with high temperature' do
      temperatures = [37.6, 37.5, 37.6, 37.6, 38]
      before do
        temperatures.each do |temp|
          TemperatureReading.create(user_id: @user.id, body_temp: temp)
        end
      end
      it 'should return true because user has treding temperture higher than 37.5' do
        expect(@user.high_temperature?).to eq(true)
      end
    end

    context 'User with low temperature' do
      temperatures = [32.6, 33.5, 32.6, 33.6, 38]
      before do
        temperatures.each do |temp|
          TemperatureReading.create(user_id: @user.id, body_temp: temp)
        end
      end
      it 'should return false because user has treding temperture lower than 37.5' do
        expect(@user.high_temperature?).to eq(false)
      end
    end
  end

  context 'factory' do
    it 'has a valid factory' do
      user = create(:user)
      expect(user.valid?).to eq(true)
    end
  end
end
