# frozen_string_literal: true

module Api
  module V1
    class TemperatureReadingsController < ApiController
      after_action :notify_user, only: [:create]

      private

      # setting optional pagination
      def load_collection
        self.current_collection =
          find_user(params[:user_id])
          .temperature_readings
          .limit(params[:limit])
          .offset(params[:offset])
      end

      def find_user(user_id)
        User.find(user_id)
      end

      def notify_user
        user = find_user(params[:temperature_reading][:user_id])

        if user&.high_temperature?
          # Configure user_mailer credentials and uncomment this line to make the emails work
          # for simplicity, user model does not have email and you have to set receiver email from credentials settings

          # UserMailer.warn_user(user).deliver_now
          puts "sending email to #{user.name}"
        end
      end

      def resource_params
        params.require(:temperature_reading).permit(
          :user_id, :body_temp
        )
      end
    end
  end
end
