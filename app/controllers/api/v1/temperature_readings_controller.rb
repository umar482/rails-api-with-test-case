# frozen_string_literal: true

module Api
  module V1
    class TemperatureReadingsController < ApiController
      
      before_action :set_actual_temp, only: [:create]

      private
      def resource_params
        params.require(:temperature_reading).permit(
          :user_id, :body_temp, :actual_temp
        )
      end

      def set_actual_temp
        @user = User.find_by(id: params[:temperature_reading][:user_id])
        debugger
        if @user
          params[:temperature_reading][:actual_temp] = params[:temperature_reading][:body_temp] + @user.gear.offset_value # temperature caliberation
        end
        debugger
      end
    end
  end
end
