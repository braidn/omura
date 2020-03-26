require 'dry/validation'
require_relative './base'

class ProductCreateContract < Dry::Validation::Contract
  params do
    required(:attributes).hash do
      required(:name).value(:string)
      required(:description).value(:string)
      required(:active).value(:boolean)
    end
  end
end
