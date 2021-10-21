class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :authenticate_api_v1_user!
    before_action :authenticate_api_v1_user!
    skip_before_action :authenticate_api_v1_user!, if: :devise_controller?

  def current_user
    current_api_v1_user
  end
end
