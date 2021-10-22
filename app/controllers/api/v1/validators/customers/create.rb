module Api
  module V1
    module Validators
      module Customers
        class Create < Base
         validates_presence_of :phone
         validate :validate_vehicle


          def initialize(params={})
            @params  = params[:customer]
            @params  = params[:customer]
          end

          def validate_vehicle
            # vehicle_validator = Vehicles::Show.new(params[:reservation_attributes])
            # return if vehicle_validator.valid?
            # debugger
            # errors.add(:vehicle, "dsadsa")
            # errors.messages["vehicle"] = vehicle_validator.errors.messages
            # errors.details["vehicle"]  = vehicle_validator.errors.details
            # add_nested_errors_for(:vehicle, vehicle_validator)
          end

        end
      end
    end
  end
end
