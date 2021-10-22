module Api
  module V1
    module Concerns
      module ValidatorHandler
        extend ActiveSupport::Concern
        BASE_PATH = "Api::V1::Validators".freeze

        def validate!
          resource =  validator_path&.constantize.new(params)
          unless resource.valid?
            render json: { error: resource.errors }, status: :unprocessable_entity
          end
        end

        def validator_path
           "#{BASE_PATH}::#{controller_name.capitalize}::#{action_name.capitalize}"
        end
      end
    end
  end
end
