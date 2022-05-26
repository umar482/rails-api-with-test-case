module Api
  module V1
    class UsersController < ApiController
      private
      def resource_params
        params.require(:user).permit(
          :name, :gear_id
        )
      end
    end
  end
end

