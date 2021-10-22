module Api
  module V1
    module Validators
      module Vehicles
        class Show < Base
         validates_presence_of :name
         validates_presence_of :id

        def initialize(params={})
          @params = params
        end

        end
      end
    end
  end
end
