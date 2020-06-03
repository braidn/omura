# frozen_string_literal: true
#
# typed: false

require 'dry/validation'
require_relative './base'

class BodyParamsContract < Dry::Validation::Contract
  params(CreateSchema) {}
end
