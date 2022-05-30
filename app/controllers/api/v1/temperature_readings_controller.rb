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

      # set pagination
      def load_collection
        self.current_collection = find_user(params[:user_id]).temperature_readings
      end

      def find_user(user_id)
        User.find(user_id)
      end

      def notify_user
        user = find_user(params[:temperature_reading][:user_id])

        if user&.high_temperature?
          # UserMailer.warn_user(user).deliver_now
          # Configure user_mailer credentials and uncomment this line to make the emails work
          # for simplicity, user model does not have email and you have to set receiver email from credentials settings
          puts "sending email to #{user.name}"
        end
      end
    end
  end
end
