module Api
  module V1
    module Validators
      class Base
        include ActiveModel::Validations

        attr_reader :params

        def initialize(params={})
          @params = params
        end

        def read_attribute_for_validation(key)
          params[key]
        end

        protected

        def add_nested_errors_for(attribute, other_validator)
          errors.messages[attribute] = other_validator.errors.messages
          errors.details[attribute]  = other_validator.errors.details
        end
      end
    end
  end
end
