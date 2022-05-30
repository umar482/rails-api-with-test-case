# frozen_string_literal: true

module Api
  module V1
    class TemperatureReadingsController < ApiController
      after_action :notify_user, only: [:create]

      private

      def resource_params
        params.require(:temperature_reading).permit(
          :user_id, :body_temp
        )
      end

      def load_collection
        self.current_collection = User.find(params[:user_id]).temperature_readings
      end

      def notify_user
        user = User.find_by(id: params[:temperature_reading][:user_id])

        if user&.high_temperature?
          # UserMailer.warn_user(user).deliver_now
          # configure GMail settings in development.rb and uncomment this code.
          puts "sending email to #{user.name}"
        end
      end
    end
  end
end
