# frozen_string_literal: true
# typed: false


class ProductResponseContract < Dry::Validation::Contract
  json(HalBase) do
    required(:name).value(:string)
    required(:description).value(:string)
    required(:active).value(:bool)
  end
end
