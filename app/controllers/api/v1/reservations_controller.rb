module Api
  module V1
    class ReservationsController < ApiController
      # before_action :validate!, only: [:create]

      private
      def resource_params
        params.require(:reservation).permit(
          :date, :time, :vehicle_id,
          customer_attributes: [ :id, :name, :email, :phone ]
        )
      end
    end
  end
end
