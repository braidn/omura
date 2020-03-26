# frozen_string_literal: true
#
# typed: true
require_relative '../schemas/body_params'

class BodyParamsValidator
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    return @app.call(env) unless req.post? || req.patch? || req.put?

    check = links_present?(req.params)

    return bad_request if check.errors.any?

    @app.call(env)
  end

  private

  def links_present?(params)
    links_contract.call(params)
  end

  def links_contract
    BodyParamsContract.new
  end

  def bad_request
    [400, { 'Content-Type' => 'application/hal+json' }, {}]
  end
end
