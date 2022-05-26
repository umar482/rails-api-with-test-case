# frozen_string_literal: true

module Api
  module V1
    class TemperatureReadingsController < ApiController
      private

      def resource_params
        params.require(:temperature_reading).permit(
          :user_id, :body_temp, :actual_temp
        )
      end
    end
  end
end
