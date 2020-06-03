# frozen_string_literal: true
#
# typed: false
require 'dry/validation'

CreateSchema =
  Dry::Schema.Params do
    required(:attributes).hash
  end
