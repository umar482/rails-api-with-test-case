describe 'PUT /api/v1/gears/:id', type: :request do
  let(:gear) { create(:gear, name: 'abc', offset_value: 1.4) }
  let(:id) { gear.id } 
  let(:api_v1_gear) { "/api/v1/gears/#{id}" }

  context 'with valid params' do
    let(:params) { { gear: { offset_value: 1.4 } } }

    it 'returns success' do    
      put api_v1_gear, params: params
      expect(response).to have_http_status(:success)
    end

    it 'updates the offset value of gear' do
      put api_v1_gear, params: params
      expect(gear.reload.offset_value).to eq(params[:gear][:offset_value])
    end

    it 'returns the gear' do
      put api_v1_gear, params: params
      expect(JSON.parse(response.body)["id"]).to eq gear.id
      expect(JSON.parse(response.body)["offset_value"]).to eq gear.offset_value
    end
  end

  context 'with invalid params' do
    let(:params) { { gear: { type: 'watch' } } }

    it 'does not return success' do
      put api_v1_gear, params: params
      expect(response).to_not have_http_status(:success)
    end

    it 'does not update the offset value' do
      put api_v1_gear, params: params
      expect(gear.reload.offset_value).to eq(params[:gear][:offset_value])
    end

    it 'returns the error' do
      put api_v1_gear, params: params
      expect(JSON.parse(response.body)['error']).to include('is not an email')
    end
  end

  context 'with missing params' do
    it 'returns the missing params error' do
      put api_v1_gear, params: {}
      expect(JSON.parse(response.body)['error']).to eq 'A required param is missing'
    end
  end
end
