# frozen_string_literal: true

describe 'get /api/v1/users/:user_id/temperature_readings', type: :request do
  before(:each) { @gear = Gear.create(name: 'abc', offset_value: 1.4) }
  before(:each) { @user = User.create(name: 'abc', gear_id: @gear.id) }
  before(:each) { @temperature_reading = TemperatureReading.create(body_temp: 10, actual_temp: 11, user_id: @user.id) }

  context 'with valid user id and have a temperature reading' do
    let(:api_v1_user_temperature_readings) { "/api/v1/users/#{@user.id}/temperature_readings" }

    it 'returns success' do
      get api_v1_user_temperature_readings
      expect(response).to have_http_status(:success)
    end

    it 'returns the list of temperature readings for the user' do
      get api_v1_user_temperature_readings
      expect(JSON.parse(response.body).length).to be > 0
    end
  end

  context 'with invalid user id' do
    let(:api_v1_user_temperature_readings) { '/api/v1/users/55/temperature_readings' }
    it 'does not return success' do
      get api_v1_user_temperature_readings
      expect(response).to have_http_status(:not_found)
    end

    it 'returns the error' do
      get api_v1_user_temperature_readings
      expect(JSON.parse(response.body)['error']).to include("Couldn't find the temperature_reading")
    end
  end
end
