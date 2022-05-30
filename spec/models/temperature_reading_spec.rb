# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TemperatureReading, type: :model do
  before(:each) { @gear = Gear.create(name: 'mi', offset_value: 1.3) }
  before(:each) { @user = User.create(name: 'ali', gear_id: @gear.id) }

  describe 'validations' do
    context 'temperature readings' do
      subject { build :temperature_reading }
      it { is_expected.to validate_presence_of(:body_temp) }
      it { should validate_numericality_of(:body_temp) }
      it { is_expected.to validate_presence_of(:actual_temp) }
      it { should validate_numericality_of(:actual_temp) }
    end
  end

  context 'factory' do
    it 'has a valid factory' do
      temperature_reading = create(:temperature_reading)
      expect(temperature_reading.valid?).to eq(true)
    end
  end
end
