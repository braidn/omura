# frozen_string_literal: true
# typed: false

HalBase = Dry::Schema.Params do
  required(:_links).hash do
    required(:self).hash do
      required(:href).value(:string)
    end
    optional(:next).hash do
      required(:href).value(:string)
    end
    optional(:items).array(:hash) do
      required(:href).value(:string)
    end
  end
end
