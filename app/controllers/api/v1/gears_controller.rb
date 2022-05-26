# frozen_string_literal: true

module Api
  module V1
    class GearsController < ApiController
      private

      def resource_params
        params.require(:gear).permit(
          :name, :offset_value
        )
      end
    end
  end
end
