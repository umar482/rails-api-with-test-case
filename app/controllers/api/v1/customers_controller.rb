module Api
  module V1
    class CustomersController < ApiController
      before_action :validate!, only: [:create]

      private
      def customer_params
        params.require(:customer).permit(
          :name, :email, :phone,
          reservation_attributes: [ :id, :vehicle_id ]
        )
      end
    end
  end
end
