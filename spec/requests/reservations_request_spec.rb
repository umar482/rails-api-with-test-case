RSpec.describe 'Reservations', type: :request do
  # initialize test data
  let!(:make) { create(:make) }
  let!(:user) { create(:user) }
  let!(:vehicle_id) { make.vehicles.first.id }
  # Test suite for GET /category

  describe 'POST /reservations' do
    context 'when the request is valid' do
      before { login }

      it 'sign in user' do
        expect(json["data"]["email"]).to eq("test@test.com")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/auth/sign_in', params: { email: 'asa' } }

      it 'returns a validation failure message' do
       expect(response.body)
      .to include("Invalid login credentials. Please try again.")
      end
    end

    context 'when the request is valid' do
      before do
        login
        @auth_params = get_auth_params_from_login_response_headers(response)
      end

      it 'get Reservations' do
        get '/api/v1/reservations', headers: @auth_params
        expect(json.size).to eq(0)
      end

      it 'create Reservations' do
        post '/api/v1/reservations', headers: @auth_params, params: params
        expect(response).to have_http_status(201)
      end
    end

    def login
      post api_v1_user_session_path, params:  { email: user.email, password: 112233 }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    end

    def params
      {
        "reservation":{
          "date": "10-10-2021",
          "time": "11:30",
          "vehicle_id": vehicle_id,
          "customer_attributes": {
          "email": "customer@test.com",
            "phone": "0333333333"
          }

        }
      }
    end

    def get_auth_params_from_login_response_headers(response)
      client = response.headers['client']
      token = response.headers['access-token']
      expiry = response.headers['expiry']
      token_type = response.headers['token-type']
      uid = response.headers['uid']
      auth_params = {
        'access-token' => token,
        'client' => client,
        'uid' => uid,
        'expiry' => expiry,
        'token-type' => token_type
      }
      auth_params
    end
  end
end
