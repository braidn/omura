# frozen_string_literal: true
#
# typed: true

require "rack"

class BodyParamsContract
  MissingParams = Struct.new(:errors)

  def call(params)
    params.include?("_links") ? links_present : links_missing
  end

  private

  def links_missing
    MissingParams.new(["Missing required _links object"])
  end

  def links_present
    MissingParams.new([])
  end
end

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
    [400, {"Content-Type" => "application/hal+json"}, {}]
  end
end
