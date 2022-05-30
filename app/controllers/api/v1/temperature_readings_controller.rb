# frozen_string_literal: true

module Api
  module V1
    class TemperatureReadingsController < ApiController
      private

      def resource_params
        params.require(:temperature_reading).permit(
          :user_id, :body_temp
        )
      end

      def load_collection
        self.current_collection = User.find(params[:user_id]).temperature_readings
      end
    end
  end
end
