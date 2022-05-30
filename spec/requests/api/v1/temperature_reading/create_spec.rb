# frozen_string_literal: true

describe 'post /api/v1/temperature_readings', type: :request do
  let(:gear) { create(:gear, name: 'abc', offset_value: 1.4) }
  let(:user) { create(:user, name: 'abc', gear: gear) }
  let(:api_v1_temp_reading) { '/api/v1/temperature_readings' }

  context 'with valid params' do
    let(:params) { { temperature_reading: { user_id: user.id, body_temp: 20 } } }

    it 'returns success' do
      post api_v1_temp_reading, params: params
      expect(response).to have_http_status(:success)
    end

    it 'returns the created temperature reading' do
      post api_v1_temp_reading, params: params
      expect(JSON.parse(response.body)['body_temp']).to eq params[:temperature_reading][:body_temp].to_f
      expect(JSON.parse(response.body)['user_id']).to eq params[:temperature_reading][:user_id]
    end
  end

  context 'with invalid params' do
    let(:params) { { temperature_reading: { body_heat: 20 } } }

    it 'does not return success' do
      post api_v1_temp_reading, params: params
      expect(response).to_not have_http_status(:success)
    end

    it 'returns the error' do
      post api_v1_temp_reading, params: params
      expect(JSON.parse(response.body)['error']).to include('found unpermitted parameter')
    end
  end

  context 'with missing params' do
    it 'returns the missing params error' do
      post api_v1_temp_reading, params: {}, as: :json
      expect(JSON.parse(response.body)['error']).to eq 'A required param is missing'
    end
  end

  context 'with body temperate not in range' do
    let(:params) { { temperature_reading: { user_id: user.id, body_temp: 200 } } }
    it 'returns error with body temperature' do
      post api_v1_temp_reading, params: params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
